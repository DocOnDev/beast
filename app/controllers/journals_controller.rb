class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  # GET /journals.json
  def index
    if current_user
      @journal_date = params[:year] ? Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i) : Date.today
      yesterday = @journal_date -1
      tomorrow = @journal_date +1
      @_yesterday = {:year => yesterday.year, :month => yesterday.month, :day => yesterday.day}
      @_tomorrow = {:year => tomorrow.year, :month => tomorrow.month, :day => tomorrow.day} unless tomorrow > Time.zone.now.beginning_of_day

      # Multiple log entries per user per day
      @entries = Entry.by_day(@journal_date).where(:user_id => current_user.id)
      # One diary per user per day
      @diary = Diary.by_day(@journal_date).where(:user_id => current_user.id).first
      if !@diary && (@journal_date <= Time.zone.now.beginning_of_day)
        @diary = Diary.new
        @diary.date = @journal_date
      end

      session[:diary_return_to] = request.url
    end

  end

  # GET /journals/1
  # GET /journals/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.fetch(:journal, {})
    end
end
