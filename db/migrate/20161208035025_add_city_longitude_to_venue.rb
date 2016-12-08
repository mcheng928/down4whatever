class AddCityLongitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :city_longitude, :float
  end
end
