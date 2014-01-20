class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :title, limit: 2147483647

      t.timestamps
    end
  end
end
