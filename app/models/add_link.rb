require "pg_search"
include PgSearch

class AddLink < ActiveRecord::Base
  validates_presence_of :link

  has_many :add_link_hashtags
  has_many :hashtags, through: :add_link_hashtags
  belongs_to :company_id

  pg_search_scope :search, :against => [:link]
end
