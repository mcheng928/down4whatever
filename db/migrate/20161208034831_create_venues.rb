class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :name

      t.timestamps

    end
  end
end
