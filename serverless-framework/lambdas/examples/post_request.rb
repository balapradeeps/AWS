require 'json'

# Define a lambda of type POST
# Function is split in 3 parts:
#   - extract fields, and if they are not present, handle error
#   - do some operations like querying database, build and return response
#   - handle unexpected errors
# Test locally with:
# [sls|serverless] invoke local
#     [-f|--function] example_post_request
#     [-p|--path] lamdas/examples/data/post_request.json
# Test deployed lambda with the url given after 'sls deploy' or with 'sls deploy list'
# More info about CLI arguments: https://www.serverless.com/framework/docs/providers/aws/cli-reference/invoke

def post_request(event:, context:)
    # extract parameters
    id = event['pathParameters']['id']        # path parameter
    if not id
        return { statusCode: 400, body: JSON.generate("Bad request. Please provide an id") }
    end

    body = event['body']
    if not body
        return { statusCode: 400, body: JSON[{'error_message': 'Please provide a body'}]}
    end
    if not body.class == String   # when doing local testing: body is already a Hash
        body = body.to_json         # in production: body is a string corresponding to a JSON object
    end
    body = JSON.parse(body, object_class: OpenStruct)   # construct an object from the string

    number = body.number

    hit = event['queryStringParameters']['hit']
    if not hit
        return { statusCode: 400, body: JSON.generate("Bad request. Please provide an id") }
    end

    hot = event['queryStringParameters']['hot']   # optional querystring parameter (not defined in serverless.yml)

    # operations
    response = {                            # Object response type is Hash (equivalent to a dictionnary in python)
        'id' => "#{id}",
        'thing' => {
            'hit' => "oh yeah that's #{hit}",
            'number' => number
        }
    }
    if hot
        response[:hot] = 23434                  # insert 'hit' field
    end

    { statusCode: 200, body: JSON[response] }
rescue StandardError => e
    # unexpected error handling
    puts e.message  
    puts e.backtrace.inspect
    { statusCode: 400, body: JSON[{"unexpected_error" => "#{e.message}"}]}
end
