class DatabaseConnection

  class << self
    attr_reader :database
  end

  def self.setup(db)
    @database = PG.connect dbname: db
    p @database
  end

  def self.query(sql)
    @database.exec "#{sql}"
  end

  

end
