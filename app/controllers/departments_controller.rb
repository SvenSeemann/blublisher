class DepartmentsController < ApplicationController
  def new
    @department = Department.new

    render layout: 'admin'
  end

  def show
    @department = Department.find(params[:id])

    respond_to do |format|

      format.json { render :show }
    end
  end

  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to :index, notice: 'Fachbereich wurde erfolgreich angelegt.' }
      else
        format.html { render :new, layout: "admin" }
      end
    end
  end

  def index
    @departments = Department.all

    render layout: 'admin'
  end

  private # -----------------------------------------------------

    def department_params
      params.require(:department).permit(:name)
    end
end
