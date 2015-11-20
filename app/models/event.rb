class Event < ActiveRecord::Base
  has_many:EventDescriptions, dependent: :destroy
  belongs_to :organizer
  belongs_to :ageGroup
  belongs_to :prefecture
  belongs_to :area
end
