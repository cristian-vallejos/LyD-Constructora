class LogbenefitsfinalsController < ApplicationController
  before_action :set_logbenefitsfinal, only: [:show, :edit, :update, :destroy]
load_and_authorize_resource
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
           Idasignacionbeneficio: value
         )
         lbf.save!
       end
     end
   end

  def index
    @logbenefitsfinals = Logbenefitsfinal.all

    if(params[:name] == "actualiza")
        end
       my_hash = JSON.parse(File.read(Rails.root + "app/data/logbenefitsfinals.txt"))

       my_hash.each do |row|
         logbf = Logbenefitsfinal.find_by(ruttrabajador: row['RUT trabajador'])
         if logbf.present? # verificar que existe
                if  row['Subcontrato'] == 'No' # Si no existe rellenar campo subcontrato (Ultimo agregado)
                  logbf.subcontrato = 1 # Si hay Subcontrato
                  logbf.nombre_subcontrato = row['Nombre Subcontrato']
                else
                  logbf.subcontrato = 0
                  logbf.nombre_subcontrato = ''
                end

        else # Si no  existe se crea
          if row.present?
          logbf   = Logbenefitsfinal.new
          logbf.areabeneficio = row['Area de Beneficio']
          logbf.nombrebeneficio = row['Nombre de Beneficio']
          logbf.costoempresa = row['Costo Empresa']
          logbf.costotrabajador = row['Costo Trabajador']
          logbf.ruttrabajador = row['RUT Trabajador']
          logbf.nombretrabajador =  row['Nombre Trabajador']
          logbf.rutbeneficiario = row['Rut Beneficiario']
          logbf.nombrebeneficiario = row['Nombre Beneficiario']
          logbf.relacion = row['Relación Beneficiario']# Buscar y asignar ultima obra
            if Loga.find_by(rut_atendido: row['RUT Trabajador']).present?
                if Obra.find_by(nombre: Loga.find_by(rut_atendido: row['RUT Trabajador']).codigo_obra ).present?
                  logbf.nombreobra = Obra.find_by(nombre: Loga.find_by(rut_atendido: row['RUT Trabajador']).codigo_obra ).codigo
                else
                  logbf.nombreobra = 0
                end
              else
            logbf.nombreobra = 0
            end
          logbf.asistebeneficio = 1
          logbf.Idasignacionbeneficio = 1 #saber que es este valor

          if  row['Subcontrato'] == 'No'
            logbf.subcontrato = 0 # No hay Subcontrato
            logbf.nombre_subcontrato = row['Nombre Subcontrato']
          else
            logbf.subcontrato = 1
            logbf.nombre_subcontrato = row['Nombre Subcontrato']
          end
        end
        logbf.save!
        end
      end

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

=begin  def actualizar

     if(params[:name] == "actualiza")
           puts("aaaaaAAAAAAAAAaaaa")
         end
        Employee.delete_all
        puts "Employees deleted"
        #my_hash = JSON.load(File.read("/var/www/myapp/REMPLESDEF2.txt"))
        my_hash = JSON.load(File.read(Rails.root + "app/data/REMPLES.txt"))

        my_hash.each do |row|


          akey = row['Rut']

          if(akey[0] == " " && akey[1] == " ")
          chars = akey.chars
          chars.delete_at(0)
          chars.delete_at(0)
            if(akey[2] == " ")
              chars.delete_at(0)
            end
          akey = chars.join
          end


          emple = Employee.new
          emple.nombre = row['Nombre']
          emple.rut = akey
          emple.cencos = row['Cencos']
          emple.estado = row['Estado']
          emple.cargo = row['Cargo']
          emple.save
        end

       redirect_to root_path
  end
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logbenefitsfinal
      @logbenefitsfinal = Logbenefitsfinal.find( params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logbenefitsfinal_params
      params.require(:logbenefitsfinal).permit(:id,:areabeneficio, :nombrebeneficio, :costoempresa, :costotrabajador, :ruttrabajador, :nombretrabajador, :rutbeneficiario, :relacion, :nombreobra, :asistebeneficio, :Idasignacionbeneficio,:subcontrato,:nombre_subcontrato)
    end
end
