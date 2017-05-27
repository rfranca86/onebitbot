class AddLinkHashtag < ActiveRecord::Base
  validates_presence_of :link_id, :hashtag_id

  belongs_to :add_link
  belongs_to :hashtag
end
