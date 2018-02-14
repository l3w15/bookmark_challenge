
task :setup_test_database do  
  connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
  connection.exec "TRUNCATE links;
  INSERT INTO links (url) VALUES ('http://facebook.com');
  INSERT INTO links (url) VALUES ('http://google.com');"
end
