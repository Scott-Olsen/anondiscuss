class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :visible
      t.string :author_IP
      t.string :username

      t.timestamps
    end
  end
end
