# This migration comes from kustomerx (originally 20160422154729)
class CreateKustomerxMessagingInfos < ActiveRecord::Migration
  def change
    create_table :kustomerx_messaging_infos do |t|
      t.integer :customer_id
      t.string :platform_messaging_login
      t.integer :messaging_platform_id
      t.text :brief_note
      t.integer :last_updated_by_id
      t.boolean :verified
      t.string :fort_token
      
      t.timestamps null: false
    end
    add_index :kustomerx_messaging_infos, :customer_id
    add_index :kustomerx_messaging_infos, :fort_token
    add_index :kustomerx_messaging_infos, :messaging_platform_id
  end
end
