require "pry"
class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(keywords)
       
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"

        db.execute(sql, name, type)
    end

    def self.find(id_num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id_num)
        
        found = self.new(result)
        found.id = result[0][0]
        found.name = result[0][1]
        found.type = result[0][2]

        return found
    end

end
