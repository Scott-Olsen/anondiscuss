class Post < ActiveRecord::Base

  # for recently invisible posts
  scope :recent_update, limit(10).order("updated_at DESC")

  has_many :comments, :foreign_key => 'parent_id'
  self.per_page = 30
  def togglevisibility
    visible = !visible?
  end
end
