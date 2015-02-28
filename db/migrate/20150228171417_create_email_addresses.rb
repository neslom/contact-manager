class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.text :address
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
