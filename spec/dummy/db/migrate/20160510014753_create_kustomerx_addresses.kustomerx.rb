# This migration comes from kustomerx (originally 20131013212837)
class CreateKustomerxAddresses < ActiveRecord::Migration
  def change
    create_table :kustomerx_addresses do |t|
      t.string :province
      t.string :city_county_district
      t.text :add_line
      t.integer :customer_id
      t.timestamps
      t.string :country
      t.text :brief_note
      t.string :fort_token
      t.integer :last_updated_by_id
    end
    
    add_index :kustomerx_addresses, :customer_id
    add_index :kustomerx_addresses, :country
    add_index :kustomerx_addresses, :province
    add_index :kustomerx_addresses, :fort_token
  end
end
