class AddReferenceAgeGroupToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :ageGroup, index: true, foreign_key: true, on_delete: :cascade
  end
end
