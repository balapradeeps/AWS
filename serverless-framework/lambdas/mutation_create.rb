require 'json'
require 'aws-sdk-dynamodb'

def mutation_create(event:, context:)
  begin
    body = event['body']
    if not body
      return { statusCode: 400, body: JSON[{'error_message': 'Please provide a body'}]}
    end
    if not body.class == String   # local testing: body is already a Hash
      body = body.to_json
    end
    body = JSON.parse(body, object_class: OpenStruct)
    id = body.id
    if not id 
      return { statusCode: 400, body: JSON[{'error_message': 'Please provide an id'}]}
    end
    region = 'eu-west-3'
    dynamodb_client = Aws::DynamoDB::Client.new(region: region)
    table_names = get_table_names(dynamodb_client)
    if table_names == 'Error'
      return { statusCode: 400, body: JSON[{'error_message' => 'Cannot get table names. Stopping program.'}]}
    elsif table_names.count.zero?
      return { statusCode: 400, body: JSON[{'error_message' => "Cannot find any tables in AWS Region '#{region}'."}]}
    else
      puts "Found #{table_names.count} tables in AWS Region '#{region}':"
      puts "(Displaying information for only the first 100 tables)" if table_names.count > 100

      table_names.each do |table_name|
        table_items_count = get_count_of_table_items(dynamodb_client, table_name)

          if table_items_count == 'Error'
            puts "Cannot get count of items for table '#{table_name}'."
          elsif table_items_count.zero?
            puts "Table '#{table_name}' has no items."
          else
            puts "Table '#{table_name}' has #{table_items_count} items."
          end
      end
    end
    response = {
      'yes' => "#{id}"
    }
    { statusCode: 200, body: JSON[response] }
  rescue StandardError => e
    puts e.backtrace.inspect
    puts e.message
    { statusCode: 400, body: JSON[{
      "unexpected_error" => "#{e.message}"
    }]}
  end
end

def get_table_names(dynamodb_client)
  result = dynamodb_client.list_tables
  result.table_names
rescue StandardError => e
  puts "Error getting table names: #{e.message}"
  'Error'
end

def get_count_of_table_items(dynamodb_client, table_name)
  result = dynamodb_client.scan(table_name: table_name)
  result.items.count
rescue StandardError => e
  puts "Error getting items for table '#{table_name}': #{e.message}"
  'Error'
end
