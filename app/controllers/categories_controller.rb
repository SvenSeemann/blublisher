class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :new, :create]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    unless @category.save
      #TODO: error handling
    end

    redirect_to category_path(@category)
  end

  def new
    @category = Category.new
  end


  private # --------------------------------------------------------------------

  def category_params
    params.require(:category).permit(:name)
  end
end
