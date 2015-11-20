class AddReferenceAreaToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :area, index: true, foreign_key: true, on_delete: :cascade
  end
end
