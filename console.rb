require("pry-byebug")
require_relative('models/property_tracker')


house1 = Property.new({
  "number_of_bedrooms" => "3",
  "year_built" => "2010",
  "status" => "let",
  "build" => "flat"
  })
  house1.save()

house2 = Property.new({
  "number_of_bedrooms" => "5",
  "year_built" => "2020",
  "status" => "buy",
  "build" => "house"
  })
house2.save()


binding.pry
nil
