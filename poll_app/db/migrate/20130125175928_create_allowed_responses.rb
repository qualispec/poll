class CreateAllowedResponses < ActiveRecord::Migration
  def up
    create_table :allowed_responses do |t|
      t.integer :poll_id
      t.string :allowed_response

      t.timestamps
    end
  end

  def down
    drop_table :allowed_responses
  end
end
