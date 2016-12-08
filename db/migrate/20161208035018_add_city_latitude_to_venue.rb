class AddCityLatitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :city_latitude, :float
  end
end
