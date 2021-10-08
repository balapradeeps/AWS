
require 'mongo'
require 'neatjson'
require 'json'

database_host = ENV['DB_HOST'] #ex: 'mongodb://sample-cluster.node.us-east-1.docdb.amazonaws.com:27017'

client_options = {
   database: ENV['DB_NAME'],
   replica_set: ENV['DB_REPLICA_SET_NAME'],
   user: ENV['DB_USER_NAME'],
   password: ENV['DB_USER_PASSWORD'],
   ssl_ca_cert = ENV['DB_SSL_CA_CERT']
   retry_writes: false,
}

def mongo(event:, context:)
   ##Create a MongoDB client, open a connection to Amazon DocumentDB as a
   ##   replica set and specify the read preference as secondary preferred
   client = Mongo::Client.new(database_host, client_options)
   
   ##Insert a single document
   x = client[:test].insert_one({"hello":"Amazon DocumentDB"})
   
   ##Find the document that was previously written
   result = client[:test].find()
   
   #Print the document
   result.each do |document|
      puts JSON.neat_generate(document)
   end

   #Close the connection
   client.close
rescue
  # error handling
  puts e.backtrace.inspect
  puts e.message
  { statusCode: 400, body: JSON[{"unexpected_error" => "#{e.message}"}]}
end
