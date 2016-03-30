class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :mac

      t.timestamps null: false
    end
  end
end
