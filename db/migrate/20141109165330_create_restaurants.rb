class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :special
      t.string :url
   
      t.timestamps
    end
  end
end
