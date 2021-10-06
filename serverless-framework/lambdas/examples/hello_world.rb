require 'json'

# Define a hello_world lambda
# Arguments:
#    - event      # object containing properties like 'method', 'header', 'body', 'path' (=endpoint)...
#                 # https://www.serverless.com/framework/docs/providers/aws/events/apigateway#request-templates
#    - context    # object containing methods like 'invoked_function_arn', 'log_group_name', 'log_stream_name'
#                 # https://docs.aws.amazon.com/lambda/latest/dg/ruby-context.html
# Returns:
#    - A JSON with a status code and a body
# Test locally with:
# [serverless|sls] invoke local
#     [-f|--function] hello_world

def hello_world(event:, context:)
  team = "Gwaihir"
  body = "Hello World ! #{team} is here !"        # variable expansion
  { statusCode: 200, body: JSON.generate(body) }  # implicit return (last statement)
rescue StandardError => e                         # C equivalent for try/catch
  puts e.message                                  # print in the console
  puts e.backtrace.inspect
  { statusCode: 400, body: JSON[{"unexpected_error" => "#{e.message}"}]} # implicit return (last statement)
end
