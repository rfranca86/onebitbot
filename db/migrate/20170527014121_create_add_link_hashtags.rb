class CreateAddLinkHashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :add_link_hashtags do |t|
      t.integer :link_id
      t.integer :hashtag_id
    end
  end
end