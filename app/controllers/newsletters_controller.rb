class NewslettersController < ApplicationController

  include NewslettersHelper

  def new
    @newsletter = Newsletter.new
    @newsletter.save!
  end

  def new_element
    @partial = find_partial_new(params[:element_type])

    respond_to do |format|
      format.js
    end
  end

  def save_element()
    @element = nil

    if !params[:article].nil? && params[:element_type] == 'Article'
      @element = save_element_article(params[:article][:id], params[:category][:category_id])
    elsif params[:element_type] == 'Upcoming'
      @element = save_element_upcoming(params[:upcoming], params[:category][:category_id])
    end

    newsletter = Newsletter.find(params[:newsletter_id])
    newsletter.news_elements << @element
    newsletter.save!

    @partial = find_partial_show(params[:element_type])
    @element = @element.newsletterable

    respond_to do |format|
      format.js
    end
  end

  private
    def save_element_article(article_id, category_id)
      news_element = NewsElement.new
      article = Article.find(article_id)
      news_element.newsletterable = article
      news_element.category = Category.find(category_id)
      news_element.save!

      return news_element
    end

    def save_element_upcoming(upcoming, category_id)
      from_date = Date.new upcoming["from(1i)"].to_i, upcoming["from(2i)"].to_i, upcoming["from(3i)"].to_i
      to_date = Date.new upcoming["to(1i)"].to_i, upcoming["to(2i)"].to_i, upcoming["to(3i)"].to_i
      news_element = NewsElement.new

      upcoming_element = UpcomingElement.new
      events = Event.where(:starts_at => from_date.beginning_of_day..to_date.end_of_day)
      upcoming_element.events = events
      news_element.category = Category.find(category_id)

      news_element.newsletterable = upcoming_element
      news_element.save

      return news_element
    end
end
