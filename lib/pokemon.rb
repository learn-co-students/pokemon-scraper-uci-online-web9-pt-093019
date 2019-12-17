class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES(?,?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    pokemon_row = db.execute(sql, id)[0]
    new_pokemon = Pokemon.new(:id => pokemon_row[0], :name => pokemon_row[1], :type => pokemon_row[2], :db => db)
  end
end
