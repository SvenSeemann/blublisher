class NewslettersController < ApplicationController

  include NewslettersHelper

  def new
    @newsletter = Newsletter.new
  end

  def new_element
    @partial = find_partial_new(params[:element_type])

    respond_to do |format|
      format.js
    end
  end

  def save_element()
    @element = nil

    if !params[:article][:id].blank? && params[:element_type] == 'Article'
      @element = save_element_article(params[:article][:id].to_i).newsletterable
    end

    @partial = find_partial_show(params[:element_type])


    respond_to do |format|
      format.js
    end
  end

  private
    def save_element_article(article_id)
      news_element = NewsElement.new
      article = Article.find(article_id)
      news_element.newsletterable = article

      news_element.save

      return news_element
    end
end
