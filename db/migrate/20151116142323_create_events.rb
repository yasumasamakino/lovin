class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :sub_title
      t.string :prefectures_cd
      t.string :area_cd
      t.string :teiin
      t.string :agegroup_cd
      t.datetime :kaisai_date
      t.string :kaisai_place
      t.string :organizer_cd
      t.text :notice
      t.string :food
      t.string :drink
      t.date :cancellation_date
      t.string :clothes
      t.string :belongings

      t.timestamps null: false
    end
  end
end
