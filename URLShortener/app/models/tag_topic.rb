class TagTopic < ActiveRecord::Base
  has_many(
    :tagging,
    :class_name => :Tagging,
    :primary_key => :id,
    :foreign_key => :tag_topics_id
  )

  has_many(
    :urls,
    :through => :tagging,
    :source => :shortened_urls
  )
end
