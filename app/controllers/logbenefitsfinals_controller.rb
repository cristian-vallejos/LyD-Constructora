class LogbenefitsfinalsController < ApplicationController
  before_action :set_logbenefitsfinal, only: [:show, :edit, :update, :destroy]

  # GET /logbenefitsfinals
  # GET /logbenefitsfinals.json
  def saveLogFinal
     params.each do |key,value| 
       Rails.logger.warn "Param #{key}: #{value}"
       if key.include?("assignbenefit")
         Rails.logger.warn "Entro"
         ab = Assignbenefit.find(value)
         benefit = Benefit.find(ab.benefit_id)
         areabenefit = Areabenefit.find(benefit.areabenefit_id)
         trabajador = Employee.find_by rut: ab.rut_trabajador
         lbf = Logbenefitsfinal.new(
           areabeneficio: areabenefit.nombre, 
           nombrebeneficio:benefit.nombre, 
           costoempresa: benefit.costotrabajador, 
           costotrabajador:benefit.costoempresa , 
           ruttrabajador:ab.rut_trabajador, 
           nombretrabajador: trabajador.nombre, 
           rutbeneficiario:ab.rut_beneficiario, 
           nombrebeneficiario: "Familiar", 
           relacion:ab.relacion, 
           nombreobra:ab.obra_id,
           asistebeneficio: 1,
           Idasignacionbeneficio: value)
         lbf.save!
       end
     end
   end
 
  def index
    @logbenefitsfinals = Logbenefitsfinal.all
  end

  # GET /logbenefitsfinals/1
  # GET /logbenefitsfinals/1.json
  def show
  end

  # GET /logbenefitsfinals/new
  def new
    @logbenefitsfinal = Logbenefitsfinal.new
  end

  # GET /logbenefitsfinals/1/edit
  def edit
  end

  # POST /logbenefitsfinals
  # POST /logbenefitsfinals.json
  def create
    @logbenefitsfinal = Logbenefitsfinal.new(logbenefitsfinal_params)

    respond_to do |format|
      if @logbenefitsfinal.save
        format.html { redirect_to @logbenefitsfinal, notice: 'Logbenefitsfinal was successfully created.' }
        format.json { render :show, status: :created, location: @logbenefitsfinal }
      else
        format.html { render :new }
        format.json { render json: @logbenefitsfinal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logbenefitsfinals/1
  # PATCH/PUT /logbenefitsfinals/1.json
  def update
    respond_to do |format|
      if @logbenefitsfinal.update(logbenefitsfinal_params)
        format.html { redirect_to @logbenefitsfinal, notice: 'Logbenefitsfinal was successfully updated.' }
        format.json { render :show, status: :ok, location: @logbenefitsfinal }
      else
        format.html { render :edit }
        format.json { render json: @logbenefitsfinal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logbenefitsfinals/1
  # DELETE /logbenefitsfinals/1.json
  def destroy
    @logbenefitsfinal.destroy
    respond_to do |format|
      format.html { redirect_to logbenefitsfinals_url, notice: 'Logbenefitsfinal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logbenefitsfinal
      @logbenefitsfinal = Logbenefitsfinal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logbenefitsfinal_params
      params.require(:logbenefitsfinal).permit(:areabeneficio, :nombrebeneficio, :costoempresa, :costotrabajador, :ruttrabajador, :nombretrabajador, :rutbeneficiario, :relacion, :nombreobra, :asistebeneficio, :Idasignacionbeneficio)
    end
end
