class LogasController < ApplicationController
  before_action :set_loga, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  

  # GET /logas
  # GET /logas.json
  def index
    @logas = Loga.all.order('created_at DESC')


    if(params[:name] == "actualizar")

      my_hash1 = JSON.load(File.read(Rails.root + "app/data/logasdef.txt"))


      my_hash1.each do |row|

        log = Loga.new
        log.codigo_obra = row['obra']
        log.rut_atendido = row['rut']
        log.nombre_atendido = row['nombre']
        log.apellido_paterno_atendido = row['apellidop']
        log.apellido_materno_atendido = row['apellidom']
        log.aspcategory_name = row['tipoconsulta']
        log.solucion = row['solucion'] 
        log.descripcion = row['descripcion']
        log.telefono = row['telefono']
        log.created_at = row['fecha']
        log.save
      end

      
      redirect_to logas_path

    end




  end

  # GET /logas/1
  # GET /logas/1.json
  def show
  end

  # GET /logas/new
  def new
    @loga = Loga.new
  end

  # GET /logas/1/edit
  def edit
  end

  # POST /logas
  # POST /logas.json
  def create
    @loga = Loga.new(loga_params)

    respond_to do |format|
      if @loga.save
        format.html { redirect_to @loga, notice: 'Loga was successfully created.' }
        format.json { render :show, status: :created, location: @loga }
      else
        format.html { render :new }
        format.json { render json: @loga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logas/1
  # PATCH/PUT /logas/1.json
  def update
    respond_to do |format|
      if @loga.update(loga_params)
        format.html { redirect_to @loga, notice: 'Loga was successfully updated.' }
        format.json { render :show, status: :ok, location: @loga }
      else
        format.html { render :edit }
        format.json { render json: @loga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logas/1
  # DELETE /logas/1.json
  def destroy
    @loga.destroy
    respond_to do |format|
      format.html { redirect_to logas_url, notice: 'Loga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loga
      @loga = Loga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loga_params
      params.require(:loga).permit(:asocial_id, :epcformulary_id, :user_name, :codigo_obra, :rut_atendido, :nombre_atendido, :apellido_paterno_atendido, :apellido_materno_atendido, :aspcategory_name, :solucion, :estado, :subcontrato, :supervisor, :descripcion, :rut_pariente, :nombre_pariente, :apellido_paterno_pariente, :apellido_materno_pariente, :parentezco, :empresa, :comentarios_caso, :caso_amerita_epc, :derivar_a)
    end
end
