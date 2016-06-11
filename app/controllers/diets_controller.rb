class DietsController < BaseController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  # GET /diets
  # GET /diets.json
  def index
    # @diets = Diet.all
    @diets = Diet.where(:user_id => current_user.id)

  end

  # GET /diets/1
  # GET /diets/1.json
  def show
    @intakes = @diet.intakes
  end

  # GET /diets/new
  def new
    @diet = Diet.new
    food_groups = FoodGroup.all
    food_groups.each {|fg|
      @diet.intakes.build(:food_group_id => fg.id)
    }
  end

  # GET /diets/1/edit
  def edit
    food_groups = FoodGroup.all
    food_groups.each {|fg|
      @diet.intakes.build(:food_group_id => fg.id) if !@diet.intakes.find_by(:food_group_id => fg.id)
    }
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)
    super
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    @update_success = @diet.update(diet_params)
    super
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_params
      params.require(:diet).permit(:start_date, :end_date, :description, :user_id, intakes_attributes: [:id, :diet_id, :food_group_id, :quantity])
    end
end
