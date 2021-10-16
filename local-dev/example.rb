# call this file with
# `my_ruby example.rb`

require 'mongo'
require 'neatjson'
require 'json'

def example(event:, context:)
    full_database_host = 'mongodb://#{ENV['DB_HOST']}:${ENV['DB_PORT']}'

    client_options = {
       database: 'diamond',
#       replica_set: ENV['DB_REPLICA_SET_NAME'],
#       user: ENV['DB_USER_NAME'],
#       password: ENV['DB_USER_PASSWORD'],
       retry_writes: false
    }

   ##Create a MongoDB client, open a connection to Amazon DocumentDB as a
   ##   replica set and specify the read preference as secondary preferred
   client = Mongo::Client.new(full_database_host, client_options)

   result = client[:diamond].find()
   puts "result: #{result}"
   
   result.each do |document|
      puts JSON.neat_generate(document)
   end

   client.close
rescue
  # error handling
  puts e.backtrace.inspect
  puts e.message
  { statusCode: 400, body: JSON[{"unexpected_error" => "#{e.message}"}]}
end

