class EpcformulariesController < ApplicationController
  before_action :set_epcformulary, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /epcformularies
  # GET /epcformularies.json
  def index
    @epcformularies = Epcformulary.all
  end

  # GET /epcformularies/1
  # GET /epcformularies/1.json
  def show
  end

  # GET /epcformularies/new
  def new
    @epcformulary = Epcformulary.new

  end

  # GET /epcformularies/1/edit
  def edit
  end

  # POST /epcformularies
  # POST /epcformularies.json
  def create
    @epcformulary = Epcformulary.new(epcformulary_params)
    #@epcformulary.asformulary = @asformulary

    respond_to do |format|
      if @epcformulary.save
        format.html { redirect_to @epcformulary, notice: 'Epcformulary was successfully created.' }
        format.json { render :show, status: :created, location: @epcformulary }
      else
        format.html { render :new }
        format.json { render json: @epcformulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epcformularies/1
  # PATCH/PUT /epcformularies/1.json
  def update
    respond_to do |format|
      if @epcformulary.update(epcformulary_params)
        format.html { redirect_to @epcformulary, notice: 'Epcformulary was successfully updated.' }
        format.json { render :show, status: :ok, location: @epcformulary }
      else
        format.html { render :edit }
        format.json { render json: @epcformulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epcformularies/1
  # DELETE /epcformularies/1.json
  def destroy
    @epcformulary.destroy
    respond_to do |format|
      format.html { redirect_to epcformularies_url, notice: 'Epcformulary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_epcformulary
      @epcformulary = Epcformulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def epcformulary_params
      params.require(:epcformulary).permit(:asformulary_id, :rut_atendido, :codigo, :nombre_pariente, :apellido_paterno_pariente, :apellido_materno_pariente, :rut_pariente, :parentesco, :empresa, :codigo_obra, :comentarios_caso, :caso_amerita_epc, :derivar_a)
    end
end
