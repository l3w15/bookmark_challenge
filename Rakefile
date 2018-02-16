require 'pg'


task :setup_test_database do
  connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
  connection.exec "TRUNCATE links CASCADE;
  INSERT INTO links
  VALUES (1, 'http://www.facebook.com', 'procrastinate with facebook');
  INSERT INTO links
  VALUES (2, 'http://www.google.com', 'ask google');"
  # connection.exec "TRUNCATE comments;"
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
      connect.exec("DROP DATABASE #{db_name}")
      connect.exec("CREATE DATABASE #{db_name}")
      connection = PG.connect dbname: db_name
      connection.exec("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR
        (60), title VARCHAR(60))")
      connection.exec("CREATE TABLE comments (
        id SERIAL NOT NULL,
        text VARCHAR(240),
        link_id int,
        PRIMARY KEY (id),
        FOREIGN KEY (link_id) REFERENCES links(id)
        )")
  end


  # rescue PG::DuplicateDatabase
    # do stuff to empty the existing databases
  end

end
