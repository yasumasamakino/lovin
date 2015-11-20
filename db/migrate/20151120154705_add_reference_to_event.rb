class AddReferenceToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :organizer, index: true, foreign_key: true, on_delete: :cascade
  end
end
