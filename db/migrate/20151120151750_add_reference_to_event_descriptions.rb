class AddReferenceToEventDescriptions < ActiveRecord::Migration
  def change
    add_reference :event_descriptions, :event, index: true, foreign_key: true, on_delete: :cascade
  end
end
