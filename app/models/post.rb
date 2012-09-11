class Post < ActiveRecord::Base

  has_many :comments, :foreign_key => 'parent_id'
end
