class RemoveAgegroupcdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :agegroup_cd, :string
  end
end
