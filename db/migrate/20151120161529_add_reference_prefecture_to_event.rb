class AddReferencePrefectureToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :prefecture, index: true, foreign_key: true, on_delete: :cascade
  end
end
