class NewslettersController < ApplicationController

  include NewslettersHelper

  def index
    @elements = NewsElement.all.order('created_at DESC')
  end

  def show
    @newsletter = Newsletter.find(params[:id])

    render layout: 'newsletter'
  end

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

  def set_title
    if !params[:title].blank?
      newsletter = Newsletter.last
      newsletter.title = params[:title]
      newsletter.save
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def save_element()
    @element = nil

    if !params[:article].nil? && params[:element_type] == 'Article'
      @element = save_element_article(params[:article][:id], params[:category][:category_id])
    elsif params[:element_type] == 'UpcomingElement'
      @element = save_element_upcoming(params[:from], params[:to], params[:category][:category_id])
    elsif params[:element_type] == 'JobWallElement'
      @element = save_employment_notices(params[:employment_notice], params[:category][:category_id])
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

    def save_element_upcoming(from, to, category_id)
      date_split = from.split("/")
      from_date = Date.new date_split[2].to_i, date_split[0].to_i, date_split[1].to_i
      date_split = to.split("/")
      to_date = Date.new date_split[2].to_i, date_split[0].to_i, date_split[1].to_i
      news_element = NewsElement.new

      upcoming_element = UpcomingElement.new
      events = Event.where(:starts_at => from_date.beginning_of_day..to_date.end_of_day)
      upcoming_element.events = events
      news_element.category = Category.find(category_id)

      news_element.newsletterable = upcoming_element
      news_element.save

      return news_element
    end

    def save_employment_notices(notices, category_id)
      news_element = NewsElement.new

      job_wall_element = JobWallElement.new

      job_wall_element.employment_notices = EmploymentNotice.where(id: notices)

      job_wall_element.save

      news_element.newsletterable = job_wall_element
      news_element.category = Category.find(category_id)

      news_element.save

      return news_element
    end
end
