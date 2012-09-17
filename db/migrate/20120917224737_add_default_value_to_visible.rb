class AddDefaultValueToVisible < ActiveRecord::Migration
  def change
    change_column :posts, :visible, :boolean, :default => true
    change_column :comments, :visible, :boolean, :default => true
  end
end
