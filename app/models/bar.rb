class Bar
  include Mongoid::Document

  field :name, type: String
  field :drink_name, type: String
  field :drink_description, type: String
  field :drink_picture_url, type: String
  field :city_walkability, type: Integer
  field :city_crime_rate, type: Float

  # Add any other fields or associations you need
end