class AddDisporderToEventDescriptions < ActiveRecord::Migration
  def change
    add_column :event_descriptions, :disp_order, :integer
  end
end
