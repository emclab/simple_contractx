# This migration comes from kustomerx (originally 20131013212912)
class CreateKustomerxContacts < ActiveRecord::Migration
  def change
    create_table :kustomerx_contacts do |t|
      t.integer :customer_id
      t.string :name
      t.string :position
      t.string :phone
      t.string :cell_phone
      t.string :email
      t.text :brief_note
      t.timestamps
      t.string :inst_messaging
      t.string :fort_token
      t.integer :last_updated_by_id
    end
    
    add_index :kustomerx_contacts, :customer_id
    add_index :kustomerx_contacts, :name
    add_index :kustomerx_contacts, :email
    add_index :kustomerx_contacts, :phone
    add_index :kustomerx_contacts, :cell_phone
    add_index :kustomerx_contacts, :fort_token
  end
end
