class LoanformulariesController < ApplicationController
  before_action :set_loanformulary, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /loanformularies
  # GET /loanformularies.json
  def index
    @loanformularies = Loanformulary.all.order('created_at DESC')
    @loanformulary = Loanformulary.new(:rut_solicitante => params[:rut_solicitante])


  end

  def filtrar

        puts params[:lasopciones]

        #@company = current_lyduser.companies.find(params[:company]) 
        #@data = Hash.new 
        #@data["btw_number"] = @company.btw_number 
        #@data["iban_number"] = @company.iban_number 
        #render json: @data and return false

  end

  def accept
    request = Loanformulary.find(params[:id])
    text = params[:loanformulary][:comentario_as]

    if(params[:accept])
      if(request.cerrado == false)
        if current_lyduser.asocial_role? && request.aceptado_por_as == nil
          request.aceptado_por_as = true
          request.comentario_as = params[:loanformulary][:comentario_as]
          request.fecha_aceptado_por_as = Date.current

        elsif current_lyduser.ao_role? && request.aceptado_por_administrativo_obra == nil
          request.aceptado_por_administrativo_obra = true
          request.comentario_administrativo_obra = params[:loanformulary][:comentario_administrativo_obra]
          request.fecha_aceptado_por_administrativo_obra = Date.current

        elsif current_lyduser.subgerente_personas_role? && request.aceptado_por_subgerente_personas == nil
          request.aceptado_por_subgerente_personas = true
          request.comentario_subgerente_personas = params[:loanformulary][:comentario_subgerente_personas]
          request.fecha_aceptado_por_subgerente_personas = Date.current

        elsif current_lyduser.jefe_remuneraciones_role? && request.aceptado_por_jefe_remuneraciones == nil
          request.aceptado_por_jefe_remuneraciones = true 
          request.comentario_jefe_remuneraciones = params[:loanformulary][:comentario_jefe_remuneraciones]
          request.fecha_aceptado_por_jefe_remuneraciones = Date.current

        end
      end
    elsif (params[:refuse])
      if(request.cerrado == false)
        if current_lyduser.asocial_role? && request.aceptado_por_as == nil
          request.aceptado_por_as = false
          request.comentario_as = params[:loanformulary][:comentario_as]
          request.fecha_aceptado_por_as = Date.current

        elsif current_lyduser.ao_role? && request.aceptado_por_administrativo_obra == nil
          request.aceptado_por_administrativo_obra = false
          request.comentario_administrativo_obra = params[:loanformulary][:comentario_administrativo_obra]
          request.fecha_aceptado_por_administrativo_obra = Date.current

        elsif current_lyduser.subgerente_personas_role? && request.aceptado_por_subgerente_personas == nil
          request.aceptado_por_subgerente_personas = false
          request.comentario_subgerente_personas = params[:loanformulary][:comentario_subgerente_personas]
          request.fecha_aceptado_por_subgerente_personas = Date.current

        elsif current_lyduser.jefe_remuneraciones_role? && request.aceptado_por_jefe_remuneraciones == nil
          request.aceptado_por_jefe_remuneraciones = false
          request.comentario_jefe_remuneraciones = params[:loanformulary][:comentario_jefe_remuneraciones]
          request.fecha_aceptado_por_jefe_remuneraciones = Date.current
        end
      end

        
    end


    if request.aceptado_por_administrativo_obra == false || request.aceptado_por_subgerente_personas == false || request.aceptado_por_jefe_remuneraciones == false
      request.cerrado = true
      request.estado = "rechazado"
    elsif request.aceptado_por_as == true && request.aceptado_por_administrativo_obra == true && request.aceptado_por_subgerente_personas == true && request.aceptado_por_jefe_remuneraciones == true
      request.cerrado = true
      request.estado = "aceptado"
    else
      request.estado = "en proceso"
    end
    
    request.save

    redirect_to loanformularies_path(request)
  end

   #fecha_aceptado_por_administrativo_obra
    #fecha_aceptado_por_subgerente_personas
    #fecha_aceptado_por_jefe_remuneraciones

  def refuse
  #request = Loanformulary.find(params[:id])

  #if(request.cerrado == false)
   # if current_lyduser.asocial_role? && request.aceptado_por_as == nil
    #  request.aceptado_por_as = false
     # request.fecha_aceptado_por_as = Date.current
    #elsif current_lyduser.ao_role?
     # request.aceptado_por_administrativo_obra = false
      #request.fecha_aceptado_por_administrativo_obra = Date.current
    #elsif current_lyduser.subgerente_personas_role?
     # request.aceptado_por_subgerente_personas = false
      #request.fecha_aceptado_por_subgerente_personas = Date.tomorrow
    #elsif current_lyduser.jefe_remuneraciones_role?
     # request.aceptado_por_jefe_remuneraciones = false
      #request.fecha_aceptado_por_jefe_remuneraciones = Date.current
    #end
  #end
    
    #request.save

    #redirect_to loanformularies_path(request)

    @client = TinyTds::Client.new username: 'proyecta', password: 'proyecta..',
    host: '192.168.1.228', port: 1433
    puts 'Connecting to SQL Server'

    if @client.active? == true then puts 'Done' end

    def execute(sql)
        result = @client.execute(sql)
        result.each
        if result.affected_rows > 0 then puts "#{result.affected_rows} row(s) affected" end
    end


    execute("USE LyDCopia;")
    results = @client.execute("SELECT * FROM RCENTROS;")

    results.each do |row|
      puts row
    end


    puts "All done."

    @client.close

     
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
    @loanformulary.lyduser = current_lyduser

    respond_to do |format|
      if @loanformulary.save

          @ao = Lyduser.where("obra = ?", params[:loanformulary][:obra])
          

          if !@ao[0].nil?
            LoanmailMailer.correo(@ao[0].email).deliver
          else
            LoanmailMailer.correo("rodespmac@gmail.com").deliver
          end


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
      params.require(:loanformulary).permit(:nombre_solicitante, :rut_solicitante, :obra, :cargo, :monto_solicitado, :monto_aprobado, :numero_cuotas, :monto_cuota, :renta_liquida, :antiguedad, :fecha_ultimo_contrato, :fondo_finiquito, :continuidad_en_obra, :descuentos_en_curso, :descripcion_documentos_respaldo, :motivo_solicitud, :comentarios, :image)
    end
end
