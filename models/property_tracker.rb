require("pg")

class Property

attr_accessor :number_of_bedrooms, :year_built, :status, :build

def initialize(options)
  @id =options["id"].to_i() if options["id"]
@number_of_bedrooms=options["number_of_bedrooms"].to_i()
@year_built=options["year_built"]
@status=options["status"]
@build=options["build"]
end

  def save()
    db = PG.connect({
    dbname: "property_tracker",
    host: "localhost"
  })
  sql = "INSERT INTO properties
    (number_of_bedrooms, year_built, status, build)
    VALUES
    ($1,$2,$3,$4) RETURNING id"
    values=[@number_of_bedrooms,@year_built,@status,@build]
    db.prepare("save", sql)
    @id=db.exec_prepared("save",values).first()["id"].to_i()
    db.close()
  end

    def delete()
      db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
    })
    sql = "DELETE FROM properties WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
    end

  def Property.all()
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "SELECT * FROM properties"
      db.prepare("all", sql)
      houses = db.exec_prepared("all")
      db.close()
      return houses.map{|house| Property.new(house)}
  end

  def Property.delete_all
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql="DELETE FROM properties"
      db.prepare("delete_all",sql)
      houses=db.exec_prepared("delete_all")
      db.close()
  end



end
