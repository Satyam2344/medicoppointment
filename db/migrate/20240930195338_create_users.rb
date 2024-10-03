class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :role
      t.string :password

      t.timestamps
    end
  end
end
