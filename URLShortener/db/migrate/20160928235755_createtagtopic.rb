class Createtagtopic < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.timestamps
      t.string :tag, :null => false
    end
  end
end
