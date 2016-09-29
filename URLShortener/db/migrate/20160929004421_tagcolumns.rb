class Tagcolumns < ActiveRecord::Migration
  def change
    remove_column :tag_topics, :tag
    add_column :tag_topics, :tag, :string, :null => false
  end
end
