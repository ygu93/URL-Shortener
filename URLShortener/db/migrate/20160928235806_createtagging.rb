class Createtagging < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.timestamps
      t.integer :shortened_url_id, :null => false
      t.integer :tag_topics_id, :null => false
    end
  end
end
