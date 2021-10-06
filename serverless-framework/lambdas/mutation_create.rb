require 'json'
require 'aws-sdk-dynamodb'

def mutation_create(event:, context:)
  # extract body from request
  body = event['body']
  if not body
    return { statusCode: 400, body: JSON[{'error_message': 'Please provide a body'}]}
  end
  if not body.class == String   # local testing: body is already a Hash
    body = body.to_json
  end
  body = JSON.parse(body, object_class: OpenStruct)

  # extract fields from body
  table = body.table
  if not table
    return { statusCode: 400, body: JSON[{'error_message': 'Please provide a table'}]}
  end
  id = body.id
  if not id
    return { statusCode: 400, body: JSON[{'error_message': 'Please provide an id'}]}
  end
  
  # operations
  region = ENV['AMAZON_REGION']
  dynamodb_client = Aws::DynamoDB::Client.new(region: region)
  table_names = get_table_names(dynamodb_client)
  
  response = {
    'yes' => "#{id}"
  }
  { statusCode: 200, body: JSON[response] }
rescue StandardError => e
  # error handling
  puts e.backtrace.inspect
  puts e.message
  { statusCode: 400, body: JSON[{
    "unexpected_error" => "#{e.message}"
  }]}
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
