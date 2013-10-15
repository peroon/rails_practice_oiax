class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :number, null: false #number of uniform
      t.string :name, null: false #nickname
      t.string :full_name #full_name
      t.string :email #mail address
      t.date :birthday #birthday
      t.integer :gender, null: false, default: 0 #0:Man 1:Woman
      t.boolean :administrator, null: false, default: false

      t.timestamps
    end
  end
end
