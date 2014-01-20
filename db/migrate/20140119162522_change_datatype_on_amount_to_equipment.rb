class ChangeDatatypeOnAmountToEquipment < ActiveRecord::Migration
  def up
    change_column :equipment, :amount, :integer

    connection.execute(%q{
      ALTER TABLE equipment
      ALTER COLUMN amount
      type integer using cast(amount as integer)
    })
  end

  def down
    change_column :equipment, :amount, :string
  end
end
