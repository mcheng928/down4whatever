class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :choice_id
      t.integer :guest_id

      t.timestamps

    end
  end
end
