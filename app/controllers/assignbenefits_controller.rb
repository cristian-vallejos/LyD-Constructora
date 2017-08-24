class AssignbenefitsController < ApplicationController
  before_action :set_assignbenefit, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /assignbenefits
  # GET /assignbenefits.json
  def index
    @assignbenefits = Assignbenefit.all
  end

  # GET /assignbenefits/1
  # GET /assignbenefits/1.json
  def show
  end

  # GET /assignbenefits/new
  def new
    @assignbenefit = Assignbenefit.new
    if params[:rut_trabajador]
      @beneficiarios = Familiartrabajador.where(rut_trabajador: params[:rut_trabajador])
  
      @beneficiarios.each do |x|
        puts x.nombre
        puts x.fechanacimiento
      end
    end
  end

  # GET /assignbenefits/1/edit
  def edit
  end

  # POST /assignbenefits
  # POST /assignbenefits.json
  def create

    @assignbenefit = Assignbenefit.new(assignbenefit_params)
    @family = Familiartrabajador.where(rut: params[:assignbenefit][:rut_beneficiario])

    if params[:assignbenefit][:rut_trabajador] != params[:assignbenefit][:rut_beneficiario] && !@family.empty?
      @assignbenefit.fecha_nacimiento = @family[0].fechanacimiento
      @assignbenefit.relacion = @family[0].relacion
    else
      @assignbenefit.fecha_nacimiento = "2017-07-07"

    end



    respond_to do |format|
      if @assignbenefit.save
        format.html { redirect_to assignbenefits_path, notice: 'Assignbenefit was successfully created.' }
        format.json { render :show, status: :created, location: @assignbenefit }
      else
        format.html { render :new }
        format.json { render json: @assignbenefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignbenefits/1
  # PATCH/PUT /assignbenefits/1.json
  def update
    respond_to do |format|
      if @assignbenefit.update(assignbenefit_params)
        format.html { redirect_to assignbenefits_path, notice: 'Assignbenefit was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignbenefit }
      else
        format.html { render :edit }
        format.json { render json: @assignbenefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignbenefits/1
  # DELETE /assignbenefits/1.json
  def destroy
    @assignbenefit.destroy
    respond_to do |format|
      format.html { redirect_to assignbenefits_url, notice: 'Assignbenefit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignbenefit
      @assignbenefit = Assignbenefit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignbenefit_params
      params.require(:assignbenefit).permit(:benefit_id, :rut_trabajador, :rut_beneficiario, :relacion, :fecha_nacimiento, :obra_id)
    end
end
