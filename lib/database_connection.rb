class DatabaseConnection

  attr_reader :db

  def self.setup(db)
    @db = PG.connect dbname: db
  end

end
