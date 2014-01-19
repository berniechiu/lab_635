class PagesController < ApplicationController

  def index
    @post = Post.new if admin_signed_in?
    @posts = Post.all
  end

  def intro
    @focus = Focus.first
  end

  def professor; end
end
