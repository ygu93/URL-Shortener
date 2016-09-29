class ShortenedUrl < ActiveRecord::Base
  belongs_to(
    :submitter,
    :class_name => 'User',
    :primary_key => :id,
    :foreign_key => :user_id
  )

  has_many(
    :visit,
    :class_name => "Visit",
    :primary_key => :id,
    :foreign_key => :short_url_id
  )

  has_many(
    :visitors,
    Proc.new { distinct },
    :through => :visit,
    :source => :visitors
  )

  has_many(
    :taggings,
    :class_name => :Tagging,
    :primary_key => :id,
    :foreign_key => :shortened_url_id
  )

  has_many(
    :tags,
    :through => :taggings,
    :source => :tag_topics

  )

  validates :short_url, :presence => true, :uniqueness => true
  validates :user_id, :presence => true

  def self.random_code
    random_string = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: random_string )
      random_string = SecureRandom.urlsafe_base64
    end
    random_string
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(long_url: long_url, user_id: user.id, short_url: self.random_code)
  end

  def num_clicks
    self.visit.select(:user_id).count
  end


  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visitors.where('visits.created_at < ?',  10.minutes.ago).count
  end
end
