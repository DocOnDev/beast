class EntriesController < BaseController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    # @entries = Entry.all
    days_ago = (params[:days_ago] || 0).to_i
    @entries = for_date_offset(days_ago)
    @_date = days_ago.days.ago.to_date

    @prev_link = view_context.link_to '<span class="tooltiptext">Previous Day</span><i class="fa fa-calendar-minus-o"></i>'.html_safe, entries_path(:days_ago => days_ago + 1)
    if (days_ago == 0)
      @today_link = view_context.link_to '<i class="fa fa-ban"></i>'.html_safe, entries_path, {:class => "disabled"}
    else
      @today_link = view_context.link_to '<span class="tooltiptext">Today</span><i class="fa fa-calendar-check-o"></i>'.html_safe, entries_path
    end
    if (days_ago > 0)
      @next_link = view_context.link_to '<span class="tooltiptext">Next Day</span><i class="fa fa-calendar-plus-o"></i>'.html_safe, entries_path(:days_ago => days_ago - 1)
    else
      @next_link = view_context.link_to '<i class="fa fa-ban"></i>'.html_safe, entries_path, {:class => "disabled"}
    end

  end

  def for_date_offset(offset = 0)
    offset = offset.to_i
    @entries = Entry.by_day(offset.days.ago).where(:user_id => current_user.id)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @entry.food_group_id = FoodGroup.find_by(:name => params[:food_group_name]).id if params[:food_group_name]
    @entry.date = params[:entry_date] if params[:entry_date]
    session[:return_to] = request.referer ? request.referer : entries_url
  end

  # GET /entries/1/edit
  def edit
    session[:return_to] = request.referer ? request.referer : entry_path(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to session.delete(:return_to), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    @update_success = @entry.update(entry_params)
    super
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:food_group_id, :user_id, :date, :portion, :description)
    end
end
