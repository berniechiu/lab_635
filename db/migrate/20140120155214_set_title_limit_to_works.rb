class SetTitleLimitToWorks < ActiveRecord::Migration
  def change
    change_column :works, :title, :string, :limit => 1500
  end
end
