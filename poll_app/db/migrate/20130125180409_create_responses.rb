class CreateResponses < ActiveRecord::Migration
  def up
    create_table :responses do |t|
      t.integer :poll_id
      t.integer :user_id
      t.integer :allowed_response_id

      t.timestamps
    end
  end

  def down
    drop_table :responses
  end
end
