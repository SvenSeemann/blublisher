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

  def save_element
    element_type = params[:element_type].classify.constantize
    @element = element_type.create(params[:element])
    @partial = find_partial_show(params[:element_type])
    respond_to do |format|
      format.js
    end
  end
end
