
require 'mongo'
require 'neatjson'
require 'json'

full_database_host = "mongodb://#{ENV['DB_HOST']}:#{ENV['DB_PORT']}" #ex: 'mongodb://sample-cluster.node.us-east-1.docdb.amazonaws.com:27017'

client_options = {
   # user: ENV['DB_USER_NAME'],
   # password: ENV['DB_USER_PASSWORD'],
   retry_writes: false
}

def mongo(event:, context:)
   ##Create a MongoDB client, open a connection to Amazon DocumentDB as a
   ##   replica set and specify the read preference as secondary preferred
   client = Mongo::Client.new(full_database_host, client_options)

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
