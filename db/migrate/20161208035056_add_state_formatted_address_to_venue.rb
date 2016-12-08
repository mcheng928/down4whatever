class AddStateFormattedAddressToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :state_formatted_address, :string
  end
end
