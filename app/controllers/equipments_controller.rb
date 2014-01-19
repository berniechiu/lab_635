# encoding: utf-8
class EquipmentsController < ApplicationController

  def create
    @equipment = Equipment.new(params[:equipment])

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to intro_path, notice: '成功新增設備!' }
        format.json { render json: @equipment, status: :created, location: intro_path }
      else
        @focus = Focus.first
        format.html { render 'pages/intro' }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    equipment = Equipment.find(params[:id])
    equipment.destroy
    redirect_to intro_path
  end
end