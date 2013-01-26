class CreatePolls < ActiveRecord::Migration
  def up
    create_table :polls do |t|
      t.text :question
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :polls
  end
end
