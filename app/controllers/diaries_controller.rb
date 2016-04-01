class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  # GET /diaries
  # GET /diaries.json
  def index
    days_ago = (params[:days_ago] || 0).to_i
    @diaries = for_date_offset(days_ago)
  end

  def for_date_offset(offset = 0)
    offset = offset.to_i
    @diaries = Diary.by_day(offset.days.ago).where(:user_id => current_user.id)
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)

    redirect_location = session.delete(:diary_return_to) || @diary

    respond_to do |format|
      if @diary.save
        format.html { redirect_to redirect_location, notice: 'Diary was successfully created.' }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update

    redirect_location = session.delete(:diary_return_to) || @diary

    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to redirect_location, notice: 'Diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_params
      params.require(:diary).permit(:date, :narrative, :sleep_score, :body_weight, :step_count, :user_id)
    end
end
