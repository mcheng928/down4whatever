class AddCityFormattedAddressToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :city_formatted_address, :string
  end
end
