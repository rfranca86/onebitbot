require 'pg_search'
include PgSearch

class Faq < ActiveRecord::Base
  validates_presence_of :question, :answer

  has_many :faq_hashtags
  has_many :hashtags, through: :faq_hashtags
  belongs_to :company

  # include PgSearch
  # escolho quais campos esse metodo vai procurar no meu model
  pg_search_scope :search, :against => [:question, :answer]
end
