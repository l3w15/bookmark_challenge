require 'pg'


task :setup_test_database do
  connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
  connection.exec "TRUNCATE links;
  INSERT INTO links (url) VALUES ('http://www.facebook.com');
  INSERT INTO links (url) VALUES ('http://www.google.com');"
end


task :set_up do
  # connect = PG.connect
  # connect.exec("CREATE DATABASE bookmark_manager_development")
  # connect.exec("CREATE DATABASE bookmark_manager_test")
  #
  # test_connect = PG.connect dbname: 'bookmark_manager_test'
  # test_connect.exec("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR
  #   (60))")
  #
  # development_connect = PG.connect dbname: 'bookmark_manager_development'
  # development_connect.exec("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR
  #   (60))")
  begin
    ["bookmark_manager_development", "bookmark_manager_test"].each do |db_name|
      connect = PG.connect
      connect.exec("CREATE DATABASE #{db_name}")
      connection PG.connect dbname: db_name
      connection.exec("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR
        (60))")
    end
  # rescue PG::DuplicateDatabase
    # do stuff to empty the existing databases
  end

end
