class EmploymentNoticesController < ApplicationController
  def new
    @employe_notice = EmploymentNotice.new

    render layout: "admin"
  end

  def create
    @employment_notice = EmploymentNotice.new(employment_notice_params)
    if @employment_notice.save
      redirect_to employment_notice_path(@employment_notice)
    else
      #TODO: error
    end
  end

  def index
  end

  def show
  end

  private

    def employment_notice_params
      params
        .require(:employment_notice)
        .permit(
          :title,
          :business_name,
          :business_phone,
          :business_mail,
          :business_street,
          :business_city,
          :business_postalcode,
          :description,
          :department_id
        )
    end
end
