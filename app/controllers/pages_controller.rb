class PagesController < ApplicationController

  def index
    @post = Post.new if admin_signed_in?
    @posts = Post.all
  end

  def intro
    @focus = Focus.first
    @equipment = Equipment.new if admin_signed_in?
    @equipments = Equipment.all
  end

  def professor
    @categories = Category.all
  end
end
