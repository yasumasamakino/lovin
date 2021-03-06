class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    #イベントの検索処理
    @events = Event.searchInCondition(params)
    #検索_フリーワードのセット
    @fw = params[:fw]
    #検索_開催日のセット
    @kaisaidate = params[:kaisaidate]
    #検索_チェックボックの作成＆セット
    @areaCheckbox = Array.new
    areas = Area.order(id: :asc)
    areaCheckedId = Array.new
    if params[:area].present?
      areaCheckedId = params[:area].split("_")
    end
    areas.each{|area|
      checked = false
      areaCheckedId.each{|checkedId|
        if checkedId == area.id.to_s
          checked = true
        end
      }
      @areaCheckbox.push([area.id, area.name, checked])
    }

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @eventDescription =  EventDescription.detail(@event.id)
  end

  # GET /events/new
#  def new
#    @event = Event.new
#  end

  # GET /events/1/edit
#  def edit
#  end

  # POST /events
  # POST /events.json
#  def create
#    @event = Event.new(event_params)
#
#    respond_to do |format|
#      if @event.save
#        format.html { redirect_to @event, notice: 'Event was successfully created.' }
#        format.json { render :show, status: :created, location: @event }
#      else
#        format.html { render :new }
#        format.json { render json: @event.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
#  def update
#    respond_to do |format|
#      if @event.update(event_params)
#        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
#        format.json { render :show, status: :ok, location: @event }
#      else
#        format.html { render :edit }
#        format.json { render json: @event.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /events/1
  # DELETE /events/1.json
  # def destroy
  #   @event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :sub_title, :prefectures_cd, :area_cd, :teiin, :agegroup_cd, :kaisai_date, :kaisai_place, :organizer_cd, :notice, :food, :drink, :cancellation_date, :clothes, :belongings)
    end
end
