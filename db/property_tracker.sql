DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  number_of_bedrooms INT,
  year_built VARCHAR(255),
  status VARCHAR(255),
  build VARCHAR(255),
  id SERIAL PRIMARY KEY
);
