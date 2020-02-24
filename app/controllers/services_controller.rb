class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update]
  before_action :authenticate_affiliate!, only: [:new, :create, :edit, :update]
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :validate_number_of_services, :only => [:new, :create]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @affiliate = current_affiliate 
  end

  # GET /services/1/edit
  def edit
    @affiliate = current_affiliate
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to affiliate_path(current_affiliate), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to affiliate_path(current_affiliate), notice: 'Service was successfully updated.'  }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description, :price, :intervals, :subtitle, :service_category_id, :affiliate_id, :lonlat, :radius, :approved, :thumbnail)
    end

    def validate_number_of_services 
      if current_affiliate.services.count >= current_affiliate.affiliate_plan.number_of_services 
        # format.html { redirect_to affiliate_path(current_affiliate), notice: 'You have reached the maximum number of services for your plan.'  }
        redirect_to affiliate_path(current_affiliate), notice: 'You have reached the maximum number of services for your plan.'  
      end 
    end 
end
