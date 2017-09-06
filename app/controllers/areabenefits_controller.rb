class AreabenefitsController < ApplicationController
  before_action :set_areabenefit, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /areabenefits
  # GET /areabenefits.json
  def index
    @areabenefits = Areabenefit.all.order('created_at ASC')
  end

  # GET /areabenefits/1
  # GET /areabenefits/1.json
  def show
  end

  def is_active

    if current_lyduser.admin_role?

      area = Areabenefit.find(params[:id])

      if area.is_active
        area.is_active = false
      else
        area.is_active = true
      end

      area.save

      redirect_to areabenefits_path

    end

    
  end

  # GET /areabenefits/new
  def new
    @areabenefit = Areabenefit.new
  end

  # GET /areabenefits/1/edit
  def edit
  end

  # POST /areabenefits
  # POST /areabenefits.json
  def create
    @areabenefit = Areabenefit.new(areabenefit_params)

    respond_to do |format|
      if @areabenefit.save
        format.html { redirect_to areabenefits_path, notice: 'Areabenefit was successfully created.' }
        format.json { render :show, status: :created, location: @areabenefit }
      else
        format.html { render :new }
        format.json { render json: @areabenefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areabenefits/1
  # PATCH/PUT /areabenefits/1.json
  def update
    respond_to do |format|
      if @areabenefit.update(areabenefit_params)
        format.html { redirect_to @areabenefit, notice: 'Areabenefit was successfully updated.' }
        format.json { render :show, status: :ok, location: @areabenefit }
      else
        format.html { render :edit }
        format.json { render json: @areabenefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areabenefits/1
  # DELETE /areabenefits/1.json
  def destroy
    @areabenefit.destroy
    respond_to do |format|
      format.html { redirect_to areabenefits_url, notice: 'Areabenefit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_areabenefit
      @areabenefit = Areabenefit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def areabenefit_params
      params.require(:areabenefit).permit(:nombre)
    end
end
