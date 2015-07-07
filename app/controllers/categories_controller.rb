class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :new, :create, :destroy]

  def index
    @categories = Category.all

    render layout: 'admin'
  end

  def show
    @category = Category.find(params[:id])

    render layout: 'admin'
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
    render layout: "admin"
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Kategorie erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end


  private # --------------------------------------------------------------------

  def category_params
    params.require(:category).permit(:name, :color)
  end
end
