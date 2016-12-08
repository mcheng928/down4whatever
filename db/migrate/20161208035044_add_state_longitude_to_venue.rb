class AddStateLongitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :state_longitude, :float
  end
end
