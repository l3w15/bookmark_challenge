require 'pg'
require_relative 'database_connection'
require 'uri'



class Link

  attr_reader :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # result = connection.exec 'SELECT * FROM links'
    result = DatabaseConnection.query('SELECT * FROM links')
    link_array = []
    result.map do |link|
      link = Link.new(link['id'], link['url'], link['title'])
      link_array << link
    end
    link_array
  end

  def self.add(url, title)
    # if url =~ URI::regexp
    working?(url)
    DatabaseConnection.query("INSERT INTO links (url, title)
                              VALUES('#{url}', '#{title}')")
      # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
      # connection.exec "INSERT INTO links (url) VALUES('#{link}')"
  end

  private

  def self.working?(url)
    fail unless url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
