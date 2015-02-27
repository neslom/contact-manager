class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.text :first_name
      t.text :last_name

      t.timestamps null: false
    end
  end
end
