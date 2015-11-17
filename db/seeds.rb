# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |i|
  Event.create(:title =>"パーティータイトル#{i}", :sub_title =>"サブタイトル#{i}",:prefectures_cd =>"1", :area_cd =>"2", :teiin =>"100人#{i}", :agegroup_cd =>"10" ,:kaisai_date => "2015/10/10",:kaisai_place => "テスト居酒屋#{i}",:organizer_cd => "11",:notice => "注意せよ#{i}",:food => "飲み放題#{i}", :drink => "食べ放題#{i}", :cancellation_date => "2016/1/10",:clothes => "裸！#{i}",:belongings =>"しゃぶ#{i}")
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')