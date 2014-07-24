class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :canonical_url
      t.text :visual_url
      t.integer :visual_height
      t.integer :visual_width
      t.string :author
      t.string :title
      t.string :keywords
      t.text :summary
      t.integer :feedly_id
      t.timestamps

    end
  end
end