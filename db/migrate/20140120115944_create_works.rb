class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :title, limit: 10000

      t.timestamps
    end
  end
end
