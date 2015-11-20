class AgeGroup < ActiveRecord::Base
  has_many:Events, dependent: :destroy
end
