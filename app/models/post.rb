class Post < ActiveRecord::Base

  has_many :comments, :foreign_key => 'parent_id'
  self.per_page = 30
  def togglevisibility
    visible = !visible?
  end
end
