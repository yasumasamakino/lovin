class RemoveOrganizercdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :organizer_cd, :string
  end
end
