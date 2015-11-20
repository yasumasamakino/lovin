class Organizer < ActiveRecord::Base
  has_many:Events, dependent: :destroy
end
