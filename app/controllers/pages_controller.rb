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
    current_year = Time.now.year - 1911
    @years = (99..current_year).to_a.reverse
    @graduate = Graduate.new if admin_signed_in?
    @past_years = @years[3..-1]

    @searched_year = Year.includes(:graduates).find_by_time(params[:year]) if params[:year]
    @past_graduates = @searched_year.graduates if @searched_year
    @current_graduates_years = Year.includes(:graduates).by_current_lab_graduates(current_year).reverse
  end
end