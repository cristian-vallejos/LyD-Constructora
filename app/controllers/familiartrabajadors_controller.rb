class FamiliartrabajadorsController < ApplicationController
  before_action :set_familiartrabajador, only: [:show, :edit, :update, :destroy]

  # GET /familiartrabajadors
  # GET /familiartrabajadors.json
  def index
    @familiartrabajadors = Familiartrabajador.all

    if params[:search]
      @results = Employee.where("nombre LIKE ? or rut LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").where(estado: "A")
      
    end


  end

  # GET /familiartrabajadors/1
  # GET /familiartrabajadors/1.json
  def show
  end

  # GET /familiartrabajadors/new
  def new
    @familiartrabajador = Familiartrabajador.new
  end

  # GET /familiartrabajadors/1/edit
  def edit
  end

  # POST /familiartrabajadors
  # POST /familiartrabajadors.json
  def create
    @familiartrabajador = Familiartrabajador.new(familiartrabajador_params)

    respond_to do |format|
      if @familiartrabajador.save
        format.html { redirect_to familiartrabajadors_path, notice: 'Familiartrabajador was successfully created.' }
        format.json { render :show, status: :created, location: @familiartrabajador }
      else
        format.html { render :new }
        format.json { render json: @familiartrabajador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familiartrabajadors/1
  # PATCH/PUT /familiartrabajadors/1.json
  def update
    respond_to do |format|
      if @familiartrabajador.update(familiartrabajador_params)
        format.html { redirect_to @familiartrabajador, notice: 'Familiartrabajador was successfully updated.' }
        format.json { render :show, status: :ok, location: @familiartrabajador }
      else
        format.html { render :edit }
        format.json { render json: @familiartrabajador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familiartrabajadors/1
  # DELETE /familiartrabajadors/1.json
  def destroy
    @familiartrabajador.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Familiartrabajador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familiartrabajador
      @familiartrabajador = Familiartrabajador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def familiartrabajador_params
      params.require(:familiartrabajador).permit(:rut, :nombre, :relacion, :fechanacimiento, :rut_trabajador)
    end
end
