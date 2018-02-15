require 'pg'
require_relative 'database_connection'
require 'uri'



class Link
  def self.all
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # result = connection.exec 'SELECT * FROM links'
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |row| row['url'] }

  end

  def self.add(link)
    # if url =~ URI::regexp
    working?(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{link}')")
      # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
      # connection.exec "INSERT INTO links (url) VALUES('#{link}')"
  end

  private

  def self.working?(link)
    fail unless link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
