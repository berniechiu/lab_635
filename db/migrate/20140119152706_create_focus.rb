class CreateFocus < ActiveRecord::Migration
  def change
    create_table :focus do |t|
      t.string :content

      t.timestamps
    end
  end
end
