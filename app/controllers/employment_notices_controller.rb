class EmploymentNoticesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new, :create, :index, :destroy]

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
    @notices = EmploymentNotice.all

    render layout: 'admin'
  end

  def show
    @employment_notice = EmploymentNotice.find(params[:id])
  end

  def destroy
    @employment_notice = EmploymentNotice.find(params[:id])
    @employment_notice.destroy

    respond_to do |format|
      format.html { redirect_to employment_notices_url, notice: 'Stellenangebot erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
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
