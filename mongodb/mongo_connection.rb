# config/initializers/mongo_connection.rb

require 'mongo'

# Get the MongoDB Atlas connection string from the DATABASE_URL environment variable
uri = ENV['DATABASE_URL']

# Set the server_api field of the options object to Stable API version 1
options = { server_api: { version: "1" } }

begin
  # Create a new client and connect to the MongoDB Atlas cluster
  client = Mongo::Client.new(uri, options)

  # Send a ping to confirm a successful connection
  admin_client = client.use('admin')
  result = admin_client.database.command(ping: 1)

  # Log a successful connection message
  Rails.logger.info("Connected to MongoDB Atlas successfully.")
rescue Mongo::Error::OperationFailure => ex
  # Handle connection errors gracefully
  Rails.logger.error("Error connecting to MongoDB Atlas: #{ex.message}")
  # You can also raise a custom exception or take other actions as needed
ensure
  # Ensure that the client is closed properly
  client&.close
end