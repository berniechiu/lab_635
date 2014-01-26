# ecoding: utf-8
class GraduatesController < ApplicationController
  def create
    @year = Year.find_by_time(params[:graduate][:year])
    if @year.blank?
      @year = Year.create!(time: params[:graduate][:year])
    end

    @graduate = @year.graduates.build(name:  params[:graduate][:name],
                                      email: params[:graduate][:email])

    respond_to do |format|
      if @graduate.save
        format.html { redirect_to graduates_path, notice: '成功新增成員!' }
        format.json { render json: @graduate, status: :created, location: graduates_path }
      else
        format.html { render 'pages/graduates' }
        format.json { render json: @graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    graduate = Graduate.find(params[:id])
    graduate.destroy
    redirect_to graduates_path
  end
end