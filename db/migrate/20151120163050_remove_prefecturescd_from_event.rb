class RemovePrefecturescdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :prefectures_cd, :string
  end
end
