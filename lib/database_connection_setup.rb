require 'database_connection'

DatabaseConnection.setup('bookmark_manager_' + ENV['RACK_ENV'])
