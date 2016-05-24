class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.references :corperations, index: true, foreign_key: true
      t.hash :status

      t.timestamps null: false
    end
  end
end
