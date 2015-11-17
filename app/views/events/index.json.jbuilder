json.array!(@events) do |event|
  json.extract! event, :id, :title, :sub_title, :prefectures_cd, :area_cd, :teiin, :agegroup_cd, :kaisai_date, :kaisai_place, :organizer_cd, :notice, :food, :drink, :cancellation_date, :clothes, :belongings
  json.url event_url(event, format: :json)
end
