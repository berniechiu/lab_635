class PagesController < ApplicationController

  def index
    @post = Post.new if admin_signed_in?
    @posts = Post.all
  end

  def intro; end

  def professor; end
end
