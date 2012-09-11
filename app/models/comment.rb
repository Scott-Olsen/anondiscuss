class Comment < ActiveRecord::Base
  belongs_to :parent, :class_name => "Post"
  self.per_page = 20
end
