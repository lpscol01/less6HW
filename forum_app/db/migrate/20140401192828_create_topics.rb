class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :subject

      t.timestamps
    end
  end
end
