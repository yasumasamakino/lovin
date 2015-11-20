class RemoveAreacdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :area_cd, :string
  end
end
