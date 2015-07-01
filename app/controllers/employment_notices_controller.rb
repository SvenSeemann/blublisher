class EmploymentNoticesController < ApplicationController
  def new
    @employe_notice = EmploymentNotice.new

    render layout: "admin"
  end

  def index
  end

  def show
  end
end
