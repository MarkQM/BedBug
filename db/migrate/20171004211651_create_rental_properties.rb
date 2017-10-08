class CreateRentalProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_properties do |t|
      t.string :title
      t.text :description
      t.integer :bedrooms
      t.integer :beds
      t.integer :maxpersons
      t.integer :bathrooms
      t.boolean :pets_allowed
      t.text :address
      t.decimal :price, precision: 10, scale: 2
      t.decimal :latitude, precision: 15, scale: 10
      t.decimal :longitude, precision: 15, scale: 10

      t.timestamps
    end
  end
end
