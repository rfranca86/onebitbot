class Hashtag < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :company
  has_many :faq_hashtags
  has_many :faqs, through: :faq_hashtags
  has_many :add_link_hashtags
  has_many :add_links, through: :add_link_hashtags
end
