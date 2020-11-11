class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
