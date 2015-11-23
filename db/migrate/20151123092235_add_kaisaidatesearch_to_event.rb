class AddKaisaidatesearchToEvent < ActiveRecord::Migration
  def change
    add_column :events, :kaisai_date_search, :date
  end
end
