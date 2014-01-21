class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :name
      t.string :email
      t.integer :year_id

      t.timestamps
    end
  end
end
