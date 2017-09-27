class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    if(params[:name] == "actualizar")


      @client = TinyTds::Client.new username: 'proyecta', password: 'proyecta..',
          host: '192.168.1.228', port: 1433
      puts 'Connecting to SQL Server'

      if @client.active? == true then puts 'Done' end

      def execute(sql)
          result = @client.execute(sql)
          result.each
          if result.affected_rows > 0 then puts "#{result.affected_rows} row(s) affected" end
      end


      execute("USE LyD;")

      file = File.open("/var/www/myapp/REMPLESDEF2.txt", 'w')


      results = @client.execute("SELECT * FROM REMPLES;")

      file.write('[')


      results.each do |row|

        jresult = row.to_json 

        file.write(jresult + ',')
      end

      file.close

      File.truncate("/var/www/myapp/REMPLESDEF2.txt", File.size("/var/www/myapp/REMPLESDEF2.txt") - 1)

      file = File.open("/var/www/myapp/REMPLESDEF2.txt", 'a')
      file.write(']')
      file.close

      puts "All done."

      @client.close

      Employee.delete_all
      puts "Employees deleted"

      my_hash = JSON.load(File.read("/var/www/myapp/REMPLESDEF2.txt"))


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
        emple.save
      end

      redirect_to root_path
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:rut, :nombre, :cencos, :estado)
    end
end
