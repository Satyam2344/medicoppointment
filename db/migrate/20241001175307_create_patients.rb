class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.bigint :phone
      t.string :age
      t.string :summary
      t.string :doctor
      t.string :appointment
      t.boolean :status

      t.timestamps
    end
  end
end
