ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

permit_params :title, :sub_title, :teiin, :kaisai_date, :kaisai_place, :notice, :food, :drink, :cancellation_date, :clothes, :belongings,:organizer_id,:ageGroup_id,:prefecture_id,:area_id,:kaisai_date_search

end
