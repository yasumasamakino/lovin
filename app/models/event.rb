class Event < ActiveRecord::Base
  has_many:EventDescriptions, dependent: :destroy
end
