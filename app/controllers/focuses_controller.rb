# encoding: utf-8
class FocusesController < ApplicationController
  before_filter :authenticate_admin!

  def update
    @focus = Focus.find(params[:id])

    if @focus.update_attributes(params[:focus])
      flash[:success] = "宗旨更新成功"
      redirect_to intro_path
    else
      render 'pages/intro'
    end
  end
end