class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true

  has_many(
    :submitted_urls,
    :class_name => :ShortenedUrl,
    :primary_key => :id,
    :foreign_key => :user_id
  )

  has_many(
    :visit,
    :class_name => "Visit",
    :primary_key => :id,
    :foreign_key => :user_id
  )

  has_many(
    :visited_urls,
    Proc.new { distinct },
    :through => :visit,
    :source => :urls
  )

end
