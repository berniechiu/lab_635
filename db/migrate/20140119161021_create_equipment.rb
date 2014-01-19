class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :amount

      t.timestamps
    end
  end
end
