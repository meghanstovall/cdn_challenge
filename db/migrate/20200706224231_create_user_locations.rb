class CreateUserLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_locations do |t|
      t.string :city
      t.string :state
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
