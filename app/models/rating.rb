class Rating < ApplicationRecord
  # Add scope for ratings per object ID
  scope :sum_by_object, -> { group(:rated_object_id).select('rated_object_id, SUM(value) AS total_likes').order('SUM(value)') }

  def self.ratings_for(object_id, value = 1)
    Rating.where(rated_object_id: object_id, value:).count
  end
end
