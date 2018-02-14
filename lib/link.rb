require 'pg'

class Link
  def self.all
    connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    result = connection.exec 'SELECT * FROM links'
    result.map { |row| row['url'] }
  end

  def self.add(link)
    connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    connection.exec "INSERT INTO links (url) VALUES('#{link}')"
  end
end
