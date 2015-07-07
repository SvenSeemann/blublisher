class DepartmentsController < ApplicationController
  def new
    @department = Department.new

    render layout: 'admin'
  end

  def show
    @department = Department.find(params[:id])

    respond_to do |format|

      format.json { render :show, layout: 'admin' }
    end
  end

  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_path, notice: 'Fachbereich wurde erfolgreich angelegt.' }
      else
        format.html { render :new, layout: "admin" }
      end
    end
  end

  def index
    @departments = Department.all

    render layout: 'admin'
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Branche erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  def get_employment_notices
    @employment_notices = Department.find(params[:id]).employment_notices

    respond_to do |format|
      format.js
    end
  end

  private # -----------------------------------------------------

    def department_params
      params.require(:department).permit(:name)
    end
end
