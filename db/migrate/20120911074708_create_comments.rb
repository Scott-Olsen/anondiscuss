class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :visible
      t.string :author_IP
      t.string :username
      t.references :parent

      t.timestamps
    end
    add_index :comments, :parent_id
  end
end
