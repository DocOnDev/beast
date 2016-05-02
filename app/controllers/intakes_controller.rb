class IntakesController < BaseController
  before_action :set_intake, only: [:show, :edit, :update, :destroy]

  # GET /intakes
  # GET /intakes.json
  def index
    # @intakes = Intake.all
    @intakes = Intake.where(:user_id => current_user.id)
  end

  # GET /intakes/1
  # GET /intakes/1.json
  def show
  end

  # GET /intakes/new
  def new
    @intake = Intake.new
  end

  # GET /intakes/1/edit
  def edit
  end

  # POST /intakes
  # POST /intakes.json
  def create
    @intake = Intake.new(intake_params)
    super
  end

  # PATCH/PUT /intakes/1
  # PATCH/PUT /intakes/1.json
  def update
    @update_success = @intake.update(intake_params)
    super
  end

  # DELETE /intakes/1
  # DELETE /intakes/1.json
  def destroy
    @intake.destroy
    respond_to do |format|
      format.html { redirect_to intakes_url, notice: 'Intake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_intake
    @intake = Intake.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def intake_params
    params.require(:intake).permit(:diet_id, :food_group_id, :quantity)
  end

end
