class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :event_id
      t.integer :venue_id

      t.timestamps

    end
  end
end
