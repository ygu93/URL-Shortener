class Tagging < ActiveRecord::Base
  belongs_to(
    :tag_topics,
    :class_name => :TagTopic,
    :primary_key => :id,
    :foreign_key => :tag_topics_id
  )

  belongs_to(
    :shortened_urls,
    :class_name => :ShortenedUrl,
    :primary_key => :id,
    :foreign_key => :shortened_url_id
  )
end
