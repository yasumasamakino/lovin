class ChangeDatatypeCancellationdateOfEvent < ActiveRecord::Migration
  def change
    change_column :events, :cancellation_date, :datetime
  end
end
