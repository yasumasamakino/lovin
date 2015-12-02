class Event < ActiveRecord::Base
  has_many:EventDescriptions, dependent: :destroy
  belongs_to :organizer
  belongs_to :ageGroup
  belongs_to :prefecture
  belongs_to :area

  def self.searchInCondition(search_param)
    sql = "select * from events"
    isFirstCondition = true
    cond = Hash.new

    logger.debug(search_param)

    fw = search_param[:fw]
    if fw.present?
      if isFirstCondition
        sql << " where"
        isFirstCondition = false
      else
        sql << " and"
      end
      sql << " (title like :fw or sub_title like :fw or kaisai_place like :fw or notice like :fw)"
      cond[:fw] = "%#{fw}%"
    end

    logger.debug(sql)

    area = search_param[:area]
    if area.present?
      area = area.split("_")
      if isFirstCondition
        sql << " where"
        isFirstCondition = false
      else
        sql << " and"
      end
      sql << " area_id in (:area)"
      cond[:area] = area
    end

    logger.debug(sql)

    kaisaidate = search_param[:kaisaidate]
    if kaisaidate.present?
      kaisaidate = kaisaidate.match(/\d{4}\/\d{2}\/\d{2}/)
      if isFirstCondition
        sql << " where"
        isFirstCondition = false
      else
        sql << " and"
      end
      sql << " kaisai_date_search = :kaisaidatesearch"
      cond[:kaisaidatesearch] = kaisaidate
    end
    Event.find_by_sql([sql , cond])
  end

end
