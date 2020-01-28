require ("pg")

class Property


def initialize(options)
  @id = options["id"].to_i() if options["id"]
@number_of_bedrooms=options["number_of_bedrooms"]
@year_built=options["year_built"]
@status=options["status"]
@build=options["build"]

end




end
