require 'json'

def retrieve_id(event:, context:)
  begin
    id = event['pathParameters']['id']
    response = {
      'id' => "#{id}"
    }
    { statusCode: 200, body: JSON[response] }
  rescue StandardError => e  
    puts e.message  
    puts e.backtrace.inspect  
  end
end
