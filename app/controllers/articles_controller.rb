class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new, :create, :index, :destroy]

  def index
    @articles = Article.all

    render layout: 'admin'
  end

  def new
    @article = Article.new

    render layout: 'admin'
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    @article.category = Category.find(category_params[:category_id].to_i) unless category_params[:category_id].blank?

    unless(@article.save)
      #TODO: show error page
    end

    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artikel erfolgreich gelöscht.' }
      format.json { head :no_content }
    end

  end

  private # --------------------------------------------------------------------

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def category_params
    params.require(:article).permit(:category_id)
  end
end
