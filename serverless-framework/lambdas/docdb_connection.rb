require 'json'
require 'mongo'
require "neatjson"

def docdb_connection(event:, context:)
    # TODO implement
    db_client = get_db_client()
    resp = db_client.describe_certificates()
    { statusCode: 200, body: JSON.generate('Hello') }
end

def get_db_client()
    ssm_client = Aws::SSM::Client.new()
    ssm_response = ssm_client.get_parameter({
        name: "/db/dns_address"
    })
    puts "db_dns_address: " + ssm_response
    db_dns_address = ssm_response
    host = "mongodb://" + db_dns_address
    options = {
        database: ENV['DB_NAME'],
        user: ENV['DB_USER_NAME'],
        password: ENV['DB_USER_PASSWORD'],
        retry_writes: false
    }
    return Mongo::client.new(host, options)
end
