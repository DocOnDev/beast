class RecipesController < BaseController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).order("name ASC")
    else
      @recipes = Recipe.all.order('name ASC')
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    food_groups = FoodGroup.all
    food_groups.each {|fg|
      @recipe.nutritional_values.build(:food_group_id => fg.id)
    }

  end

  # GET /recipes/1/edit
  def edit
    food_groups = FoodGroup.all
    food_groups.each {|fg|
      @recipe.nutritional_values.build(:food_group_id => fg.id) if !@recipe.nutritional_values.find_by(:food_group_id => fg.id)
    }
  end

  # GET /recipes/1/log
  def log
    set_recipe
  end

  # POST /recipes/1/updatelog
  def updatelog
    set_recipe
    #TODO: Add records to the entries table for converted quantity of recipe components

    respond_to do |format|
      log_unit = params[:log][:unit]

      log_measure = Measurement.parse("#{params[:log][:quantity]} #{log_unit}")
      recipe_measure = Measurement.parse("#{@recipe.quantity} #{@recipe.unit}")
      multiplier = (log_measure / recipe_measure).convert_to(log_unit).quantity

      entry_details = {}
      @recipe.nutritional_values.each do |nv|
        new_qty = nv.quantity * multiplier
        _date = Date.new(params[:logdate][:year].to_i,params[:logdate][:month].to_i,params[:logdate][:day].to_i)
        entry_details[nv.food_group.name] = {:portion => new_qty, :food_group_id => nv.food_group.id, :description => @recipe.name, :date => _date, :user_id => current_user.id}
      end

      ActiveRecord::Base.transaction do
        entry_details.each do |name, values|
          e = Entry.create!(values)
          e.save
        end
      end

      response_message = "Recipe #{@recipe.name} was recorded for #{params[:log][:quantity]} #{params[:log][:unit]}."
      format.html { redirect_to recipes_url, notice: response_message }
    end
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: "#{@recipe.name} recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @redirect_location = recipes_url
    @update_success = @recipe.update(recipe_params)
    super
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
      if @recipe.quantity && @recipe.unit
        user_measurement = "#{@recipe.quantity} #{@recipe.unit}"
        measurement = Measurement.parse(user_measurement)
        @recipe.quantity = measurement.quantity
        @recipe.unit = measurement.unit
        @conversions = [measurement.unit.to_s.gsub(/\./,'')]
        Measurement::Unit[measurement.unit].conversions.each { |cv|
          @conversions << cv
        }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :web_page, :quantity, :unit, nutritional_values_attributes: [:id, :recipe_id, :food_group_id, :quantity])
    end

end
