class NewslettersController < ApplicationController

  include NewslettersHelper

  def new
    @newsletter = Newsletter.new
  end

  def new_element
    @partial = find_partial(params[:element_type])

    respond_to do |format|
      format.js # actually means: if the client ask for js -> return file.js
    end
  end
end
