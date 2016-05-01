class BaseController < ApplicationController

  protected

  def instance_variable
    @instance_variable ||= instance_variable_get("@#{controller_name.singularize}")
  end

  def instance_name
    @instance_name ||= controller_name.singularize.capitalize
  end

  def update
    respond_to do |format|
      if @update_success
        format.html { redirect_to redirect_target(instance_variable), notice: "#{instance_name} was successfully updated." }
        format.json { render :show, status: :ok, location: instance_variable }
      else
        format.html { render :edit }
        format.json { render json: instance_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    respond_to do |format|
      if instance_variable.save
        format.html { redirect_to redirect_target(instance_variable), notice: "#{instance_name} was successfully created." }
        format.json { render :show, status: :created, location: @diet }
      else
        format.html { render :new }
        format.json { render json: instance_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirect_target(instance_variable)
    (@redirect_location ? @redirect_location : instance_variable)
  end
end
