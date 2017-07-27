class AsformulariesController < ApplicationController
  before_action :set_asformulary, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  #authorize_resource :class => false




  # GET /asformularies
  # GET /asformularies.json
  def index
    @asformularies = Asformulary.all
    @asformulary = Asformulary.new(:rut_atendido => params[:rut_atendido])

  end

  # GET /asformularies/1
  # GET /asformularies/1.json
  def show
  

  end

  # GET /asformularies/new
  def new

      @asformulary = Asformulary.new
    #@epcformulary = Epcformulary.new(asformulary_id: params[:asformulary_id])
  end

  def checkrut
    redirect_to new_asformulary_path
  end

  def newseg
    #@asformulary = Asformulary.new
    #find-create-set-save 

    theasformulary = Asformulary.find(params[:id])

    if theasformulary.atencion_id == nil
      theasformulary.atencion_id = theasformulary.id
      theasformulary.save
      @asformulary = Asformulary.new(
      rut_atendido: theasformulary.rut_atendido,
      user_id: theasformulary.user_id,
      aspcategory_id: theasformulary.aspcategory_id,
      benefit_id: theasformulary.benefit_id,
      atencion_id: theasformulary.id,
      numero_atencion: theasformulary.numero_atencion+1
      )
    elsif theasformulary.atencion_id != nil
      @asformulary = Asformulary.new(
      rut_atendido: theasformulary.rut_atendido,
      user_id: theasformulary.user_id,
      aspcategory_id: theasformulary.aspcategory_id,
      benefit_id: theasformulary.benefit_id,
      atencion_id: theasformulary.atencion_id,
      numero_atencion: theasformulary.numero_atencion+1
      )
    end



  end

  # GET /asformularies/1/edit
  def edit


  end

  # POST /asformularies
  # POST /asformularies.json
  def create
    if (params[:check])
   

      redirect_to new_asformulary_path#(rut_atendido: params[:asformulary][:rut_atendido])
    else
      @asformulary = Asformulary.new(asformulary_params)
      @asformulary.lyduser = current_lyduser
      @asformulary.user_id = 1

    
      respond_to do |format|
        if @asformulary.save
          format.html { redirect_to asformularies_path}#, notice: 'Asformulary was successfully created.' }
          format.json { render :show, status: :created, location: @asformulary }
        else
          format.html { render :new }
          format.json { render json: @asformulary.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /asformularies/1
  # PATCH/PUT /asformularies/1.json
  def update
    respond_to do |format|
      if @asformulary.update(asformulary_params)
        format.html { redirect_to @asformulary, notice: 'Asformulary was successfully updated.' }
        format.json { render :show, status: :ok, location: @asformulary }
      else
        format.html { render :edit }
        format.json { render json: @asformulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asformularies/1
  # DELETE /asformularies/1.json
  def destroy
    @asformulary.destroy
    respond_to do |format|
      format.html { redirect_to asformularies_url, notice: 'Asformulary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asformulary
      @asformulary = Asformulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asformulary_params
      params.require(:asformulary).permit(:rut_atendido, :codigo_obra, :user_id, :nombre_atendido, :apellido_paterno, :apellido_materno, :aspcategory_id, :solucion, :estado, :subcontrato, :nombre_supervisor, :descripcion, :telefono, :benefit_id, :atencion_id, :numero_atencion, :lyduser_id)
    end
end
