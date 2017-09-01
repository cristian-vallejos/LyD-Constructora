class AspcategoriesController < ApplicationController
  before_action :set_aspcategory, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /aspcategories
  # GET /aspcategories.json
  def index
    @aspcategories = Aspcategory.all
  end

  # GET /aspcategories/1
  # GET /aspcategories/1.json
  def show
  end

  def is_active

    if current_lyduser.admin_role?

      area = Aspcategory.find(params[:id])

      if area.is_active
        area.is_active = false
      else
        area.is_active = true
      end

      area.save

      redirect_to aspcategories_path

    end

    
  end

  # GET /aspcategories/new
  def new
    @aspcategory = Aspcategory.new
  end

  # GET /aspcategories/1/edit
  def edit
  end

  # POST /aspcategories
  # POST /aspcategories.json
  def create
    @aspcategory = Aspcategory.new(aspcategory_params)

    respond_to do |format|
      if @aspcategory.save
        format.html { redirect_to aspcategories_path, notice: 'Aspcategory was successfully created.' }
        format.json { render :show, status: :created, location: @aspcategory }
      else
        format.html { render :new }
        format.json { render json: @aspcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aspcategories/1
  # PATCH/PUT /aspcategories/1.json
  def update
    respond_to do |format|
      if @aspcategory.update(aspcategory_params)
        format.html { redirect_to @aspcategory, notice: 'Aspcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @aspcategory }
      else
        format.html { render :edit }
        format.json { render json: @aspcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aspcategories/1
  # DELETE /aspcategories/1.json
  def destroy
    @aspcategory.destroy
    respond_to do |format|
      format.html { redirect_to aspcategories_url, notice: 'Aspcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aspcategory
      @aspcategory = Aspcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aspcategory_params
      params.require(:aspcategory).permit(:nombre)
    end
end
