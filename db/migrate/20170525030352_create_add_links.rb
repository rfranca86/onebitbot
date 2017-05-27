class CreateAddLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :add_links do |t|
      t.string :link
      t.integer :company_id
    end
  end
end
