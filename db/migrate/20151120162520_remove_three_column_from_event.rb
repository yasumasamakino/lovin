class RemoveThreeColumnFromEvent < ActiveRecord::Migration
  def change
    def up
      remove_column :prefectures_cd, :area_cd, :agegroup_cd
    end

    def down
      add_column :prefectures_cd, :area_cd, :string
    end
  end
end
