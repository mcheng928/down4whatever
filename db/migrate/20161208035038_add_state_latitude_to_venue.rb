class AddStateLatitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :state_latitude, :float
  end
end
