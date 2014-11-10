class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :send_text, default: false
     
      t.timestamps
    end
  end
end
