class StatsController < ApplicationController
  # GET /stats
  # GET /stats.json
  def index
    if current_user
      @stats_date = params[:year] ? Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i) : Date.today
      yesterday = @stats_date -1
      tomorrow = @stats_date +1
      @_yesterday = {:year => yesterday.year, :month => yesterday.month, :day => yesterday.day}
      @_tomorrow = {:year => tomorrow.year, :month => tomorrow.month, :day => tomorrow.day} unless tomorrow > Time.zone.now.beginning_of_day
      @display_date = @stats_date.to_formatted_s(:rfc822)
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def stats_params
      params.fetch(:stats, {})
    end

end
