class PagesController < ApplicationController

  def index
    if admin_signed_in?
      @post = Post.new
    end

    @posts = Post.all
  end

  def intro; end

  def professor; end
end
