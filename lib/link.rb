require 'pg'
require_relative 'database_connection'
require 'uri'



class Link

  attr_reader :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # result = connection.exec 'SELECT * FROM links'
    result = DatabaseConnection.query('SELECT * FROM links')
    link_array = []
    result.map do |link|
      link = Link.new(link['id'], link['url'])
      link_array << link
    end
    link_array
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
    fail link unless link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
