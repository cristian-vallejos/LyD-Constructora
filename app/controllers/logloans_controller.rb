class LogloansController < ApplicationController
  before_action :set_logloan, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /logloans
  # GET /logloans.json
  def index
    @logloans = Logloan.all.order('created_at DESC')


    if(params[:name] == "actualizar")

      my_hash = JSON.load(File.read(Rails.root + "app/data/logloandef.txt"))


      my_hash.each do |row|

        loan = Logloan.new
        loan.nombre_solicitante = row['nombre'] + " " + row['apellidos']
        loan.rut_solicitante = row['rut']
        loan.empresa = row['empresa']
        loan.obra = row['obra']
        loan.monto_solicitado = row['montosolicitado']
        loan.numero_cuotas = row['numcuotas']
        loan.created_at = row['fechaentrega']
        loan.por_pagar = row['porpagar']
        loan.monto_pagado = row['montopagado']
        loan.motivo_solicitud = row['motivoprestamo']
        loan.comentarios = row['descripcion']
        loan.estado = row['estado']
        loan.save
      end

      redirect_to logloans_path


    end



  end

  # GET /logloans/1
  # GET /logloans/1.json
  def show
  end

  # GET /logloans/new
  def new
    @logloan = Logloan.new
  end

  # GET /logloans/1/edit
  def edit
  end

  # POST /logloans
  # POST /logloans.json
  def create
    @logloan = Logloan.new(logloan_params)
    

    respond_to do |format|
      if @logloan.save



        format.html { redirect_to @logloan, notice: 'Logloan was successfully created.' }
        format.json { render :show, status: :created, location: @logloan }
      else
        format.html { render :new }
        format.json { render json: @logloan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logloans/1
  # PATCH/PUT /logloans/1.json
  def update
    respond_to do |format|
      if @logloan.update(logloan_params)
        format.html { redirect_to @logloan, notice: 'Logloan was successfully updated.' }
        format.json { render :show, status: :ok, location: @logloan }
      else
        format.html { render :edit }
        format.json { render json: @logloan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logloans/1
  # DELETE /logloans/1.json
  def destroy
    @logloan.destroy
    respond_to do |format|
      format.html { redirect_to logloans_url, notice: 'Logloan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logloan
      @logloan = Logloan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logloan_params
      params.require(:logloan).permit(:rut_solicitante, :nombre_solicitante, :obra, :cargo, :monto_solicitado, :numero_cuotas, :monto_pagado, :por_pagar, :motivo_solicitud, :comentarios, :estado)
    end
end
