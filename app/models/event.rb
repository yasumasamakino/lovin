class Event < ActiveRecord::Base
  has_many:EventDescriptions, dependent: :destroy
  belongs_to :organizer
  belongs_to :ageGroup
  belongs_to :prefecture
  belongs_to :area

  def self.searchInCondition(search_param)
    sql = ""
    sql << "select evt.*"
    sql << " ,org.name as org_name"
    sql << " ,agp.name as ageGrp_name"
    sql << " ,ara.name as area_name"
    sql << " from events evt"
    sql << " join organizers org on evt.organizer_id = org.id"
    sql << " join age_groups agp on evt.ageGroup_id = agp.id"
    sql << " join areas ara on evt.area_id = ara.id"
    isFirstCondition = true
    cond = Hash.new

    # logger.debug(search_param)

    fw = search_param[:fw]
    if fw.present?
      if isFirstCondition
        sql << " where"
        isFirstCondition = false
      else
        sql << " and"
      end
      sql << " (evt.title like :fw or evt.sub_title like :fw or evt.kaisai_place like :fw or evt.notice like :fw)"
      cond[:fw] = "%#{fw}%"
    end

    # logger.debug(sql)

    area = search_param[:area]
    if area.present?
      area = area.split("_")
      if isFirstCondition
        sql << " where"
        isFirstCondition = false
      else
        sql << " and"
      end
      sql << " evt.area_id in (:area)"
      cond[:area] = area
    end

    # logger.debug(sql)

    kaisaidate = search_param[:kaisaidate]
    if kaisaidate.present?
      kaisaidate = kaisaidate.match(/\d{4}\/\d{2}\/\d{2}/)
      if isFirstCondition
        sql << " where"
        isFirstCondition = false
      else
        sql << " and"
      end
      sql << " evt.kaisai_date_search = :kaisaidatesearch"
      cond[:kaisaidatesearch] = kaisaidate
    end
    Event.find_by_sql([sql , cond])
  end

end
