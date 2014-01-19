class ChangeDatatypeOnAmountToEquipment < ActiveRecord::Migration
  def up
    change_column :equipment, :amount, :integer
  end

  def down
    change_column :equipment, :amount, :string
  end
end
