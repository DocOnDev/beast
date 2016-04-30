class BaseController < ApplicationController

  protected

  def update
    instance_variable = instance_variable_get("@#{controller_name.singularize}")

    respond_to do |format|
      if @update_success
        format.html { redirect_to (@redirect_location ? @redirect_location : instance_variable), notice: "#{controller_name.singularize.capitalize} was successfully updated." }
        format.json { render :show, status: :ok, location: instance_variable }
      else
        format.html { render :edit }
        format.json { render json: instance_variable.errors, status: :unprocessable_entity }
      end
    end
  end
end
