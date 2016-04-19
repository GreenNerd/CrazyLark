class CreateGetMacs < ActiveRecord::Migration
  def change
    create_table :get_macs do |t|
      t.string :"mac"
      t.string :"1"

      t.timestamps null: false
    end
  end
end
