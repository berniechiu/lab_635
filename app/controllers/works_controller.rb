# encoding: utf-8
class WorksController < ApplicationController
  before_filter :authenticate_admin!

  def create
    @category = Category.find(params[:work][:category_id])
    @work = @category.works.build(title: params[:work][:title])

    respond_to do |format|
      if @work.save
        format.html { redirect_to professor_path, notice: '成功新增著作!' }
        format.json { render json: @work, status: :created, location: professor_path }
      else
        @categories = Category.all
        format.html { render 'pages/professor' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to professor_path
  end
end
