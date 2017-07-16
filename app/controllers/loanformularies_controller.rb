class LoanformulariesController < ApplicationController
  before_action :set_loanformulary, only: [:show, :edit, :update, :destroy]

  # GET /loanformularies
  # GET /loanformularies.json
  def index
    @loanformularies = Loanformulary.all
  end

  def accept
    request = Loanformulary.find(params[:id])
    if current_lyduser.asocial_role?
      request.aceptado_por_as = true
    elsif current_lyduser.administrativo_obra_role?
      request.aceptado_por_administrativo_obra = true
    elsif current_lyduser.subgerente_personas_role?
      request.aceptado_por_subgerente_personas = true
    elsif current_lyduser.jefe_remuneraciones_role?
      request.aceptado_por_jefe_remuneraciones = true
    end
    
    request.save

    redirect_to loanformularies_path(request)
  end

  def refuse
    request = Loanformulary.find(params[:id])
    if current_lyduser.asocial_role?
      request.aceptado_por_as = false
    elsif current_lyduser.administrativo_obra_role?
      request.aceptado_por_administrativo_obra = false
    elsif current_lyduser.subgerente_personas_role?
      request.aceptado_por_subgerente_personas = false
    elsif current_lyduser.jefe_remuneraciones_role?
      request.aceptado_por_jefe_remuneraciones = false
    end
    
    request.save

    redirect_to loanformularies_path(request)
     
  end

  # GET /loanformularies/1
  # GET /loanformularies/1.json
  def show
  end

  # GET /loanformularies/new
  def new
    @loanformulary = Loanformulary.new
  end

  # GET /loanformularies/1/edit
  def edit
  end

  # POST /loanformularies
  # POST /loanformularies.json
  def create
    @loanformulary = Loanformulary.new(loanformulary_params)

    respond_to do |format|
      if @loanformulary.save
        format.html { redirect_to @loanformulary, notice: 'Loanformulary was successfully created.' }
        format.json { render :show, status: :created, location: @loanformulary }
      else
        format.html { render :new }
        format.json { render json: @loanformulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loanformularies/1
  # PATCH/PUT /loanformularies/1.json
  def update
    respond_to do |format|
      if @loanformulary.update(loanformulary_params)
        format.html { redirect_to @loanformulary, notice: 'Loanformulary was successfully updated.' }
        format.json { render :show, status: :ok, location: @loanformulary }
      else
        format.html { render :edit }
        format.json { render json: @loanformulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loanformularies/1
  # DELETE /loanformularies/1.json
  def destroy
    @loanformulary.destroy
    respond_to do |format|
      format.html { redirect_to loanformularies_url, notice: 'Loanformulary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loanformulary
      @loanformulary = Loanformulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loanformulary_params
      params.require(:loanformulary).permit(:nombre_solicitante, :rut_solicitante, :obra, :cargo, :monto_solicitado, :monto_aprobado, :numero_cuotas, :monto_cuota, :renta_liquida, :antiguedad, :fecha_ultimo_contrato, :fondo_finiquito, :continuidad_en_obra, :descuentos_en_curso, :descripcion_documentos_respaldo, :motivo_solicitud, :comentarios)
    end
end
