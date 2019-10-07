class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    redirect_to category_url(:id => params[:category]) unless params[:category].nil?
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end
end
