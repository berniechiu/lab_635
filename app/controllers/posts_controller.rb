# encoding: utf-8
class PostsController < ApplicationController
  before_filter :authenticate_admin!

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: '成功新增消息!' }
        format.json { render json: @post, status: :created, location: root_path }
      else
        @posts = Post.all
        format.html { render 'pages/index' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
end
