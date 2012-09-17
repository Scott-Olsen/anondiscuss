class Post < ActiveRecord::Base

  # for recently invisible posts
  scope :recent_update, limit(10).order("updated_at DESC")

  has_many :comments, :foreign_key => 'parent_id'
  self.per_page = 30
  def update_record_without_timestamping
    class << self
      def record_timestamps; false; end
    end
    save!
    class << self
      remove_method :record_timestamps
    end
  end
  def togglevisibility!
    visible = !visible?
    update_record_without_timestamping
  end
end
