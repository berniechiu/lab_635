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
    @work = Work.new
  end

  def graduates
    if admin_signed_in?
      current_year = Time.now.year - 1911
      @years = (99..current_year).to_a.reverse
      @graduate = Graduate.new
    end
    @show_current_graduates = Year.by_current_lab_graduates(current_year)
  end
end