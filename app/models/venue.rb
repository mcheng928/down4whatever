class Venue < ApplicationRecord
  before_save :geocode_state

  def geocode_state
    if self.state.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.state)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.state_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.state_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.state_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  before_save :geocode_city

  def geocode_city
    if self.city.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.city)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.city_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.city_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.city_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  before_save :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :choices,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :name, :uniqueness => { :scope => [:state, :city, :address] }

  validates :name, :presence => true

end
