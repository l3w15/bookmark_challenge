require 'pg'
require_relative 'database_connection'

class Link
  def self.all
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # result = connection.exec 'SELECT * FROM links'
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |row| row['url'] }

  end

  def self.add(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{link}')")
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # connection.exec "INSERT INTO links (url) VALUES('#{link}')"
  end
end
