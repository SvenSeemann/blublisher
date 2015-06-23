class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

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
end
