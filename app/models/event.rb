class Event < ActiveRecord::Base
  has_many:EventDescriptions, dependent: :destroy
  belongs_to :organizer
end
