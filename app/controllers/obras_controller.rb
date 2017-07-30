class ObrasController < ApplicationController
  before_action :set_obra, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /obras
  # GET /obras.json
  def index
    @obras = Obra.all

    if(params[:name] == "actualizar")

      #puts "hello index actualizar"

      @client = TinyTds::Client.new username: 'proyecta', password: 'proyecta..',
          host: '192.168.1.228', port: 1433, login_timeout: 20
      puts 'Connecting to SQL Server'

      if @client.active? == true then puts 'Done' end

      def execute(sql)
          result = @client.execute(sql)
          result.each
          if result.affected_rows > 0 then puts "#{result.affected_rows} row(s) affected" end
      end


      execute("USE LyDCopia;")
      results = @client.execute("SELECT * FROM RCENTROS;")
      #en principio es esto, pero hay que cambiar a la tabla original

      results.each do |row|

        akey = row["Codigo"]
        if(akey[0] == " " && akey[1] == " ")
          chars = akey.chars
          chars.delete_at(0)
          chars.delete_at(0)
          if(akey[2] == " ")
            chars.delete_at(0)
          end
        akey = chars.join
        end
        #puts akey
      getobra = Obra.where(:nombre => akey)  

      if getobra == nil  
        obran = Obra.new
        #obran.codigo = row['codigo']
        obran.nombre = akey
        obran.save
      end

   end




puts "All done."

@client.close



      redirect_to obras_path

    end


  end

  # GET /obras/1
  # GET /obras/1.json
  def show
  end

  # GET /obras/new
  def new
    @obra = Obra.new
  end

  # GET /obras/1/edit
  def edit
  end

  # POST /obras
  # POST /obras.json
  def create
    @obra = Obra.new(obra_params)

    respond_to do |format|
      if @obra.save
        format.html { redirect_to @obra, notice: 'Obra was successfully created.' }
        format.json { render :show, status: :created, location: @obra }
      else
        format.html { render :new }
        format.json { render json: @obra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obras/1
  # PATCH/PUT /obras/1.json
  def update
    respond_to do |format|
      if @obra.update(obra_params)
        format.html { redirect_to @obra, notice: 'Obra was successfully updated.' }
        format.json { render :show, status: :ok, location: @obra }
      else
        format.html { render :edit }
        format.json { render json: @obra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obras/1
  # DELETE /obras/1.json
  def destroy
    @obra.destroy
    respond_to do |format|
      format.html { redirect_to obras_url, notice: 'Obra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obra
      @obra = Obra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obra_params
      params.require(:obra).permit(:nombre, :direccion)
    end
end
