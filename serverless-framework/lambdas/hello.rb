require 'json'

def hello(event:, context:)
  begin
    { statusCode: 200, body: JSON.generate("secret_env_var = ") }
  rescue StandardError => e  
    puts e.message  
    puts e.backtrace.inspect  
    { statusCode: 400, body: JSON.generate("Bad request") }
  end
end
