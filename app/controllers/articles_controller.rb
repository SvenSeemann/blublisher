class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new, :create ]

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

  private # --------------------------------------------------------------------

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def category_params
    params.require(:article).permit(:category_id)
  end
end
