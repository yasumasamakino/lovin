class AddTitleToEventDescriptions < ActiveRecord::Migration
  def change
    add_column :event_descriptions, :title, :string
  end
end
