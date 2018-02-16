require 'pg'
require_relative 'database_connection'
require 'uri'

class Link

  attr_reader :url, :title, :id

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add(url, title)
    # if url =~ URI::regexp
    working?(url)
    DatabaseConnection.query("INSERT INTO links (url, title)
                              VALUES('#{url}', '#{title}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id}")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM links WHERE id = #{id}")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }.first
  end

  def self.update(url, title, id)
    working?(url)
    DatabaseConnection.query("UPDATE links SET url = '#{url}', title = '#{title}' WHERE id = #{id}")
  end

  private

  def self.working?(url)
    fail unless url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
