require 'json'

def hello(event:, context:)
  begin
    { statusCode: 200, body: JSON.generate("Function executed successfully!") }
  rescue StandardError => e  
    puts e.message  
    puts e.backtrace.inspect  
    { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
  end
end
