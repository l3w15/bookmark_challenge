class DatabaseConnection

  def self.database
    @database
  end

  def self.setup(db)
    @database = PG.connect(dbname: db)
  end

  # This is another way to add a class attr reader
  # class << self
  #   attr_reader :database
  # end

  def self.query(sql)
    @database.exec(sql)
  end

end
