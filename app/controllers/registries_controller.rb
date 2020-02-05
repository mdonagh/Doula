class RegistriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    @registries = Registry.all
    if params[:q]
      @registries = Registry.search_by_name(params[:q]).records
    end
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
  end

  # GET /registries/new
  def new
    @registry = Registry.new
  end

  # GET /registries/1/edit
  def edit
  end

  # POST /registries
  # POST /registries.json
  def create
    @registry = Registry.new(registry_params)
    #converts and assign due_date
    @registry.due_date = Date.strptime(registry_params[:due_date], '%m/%d/%Y')

    #assign the registry to the currently logged in user 
    @registry.user_id = current_user.id

    #assign the registry name
    @registry.name = current_user.first_name.capitalize + "'s Registry"

    #assign the slug 
    @registry.slug = "#{current_user.first_name.downcase}-#{current_user.last_name.downcase}-#{Time.now.strftime('%d-%m')}"

    if @registry.save
      #assign current_registry_id 
      current_user.current_registry_id = @registry.id

      current_user.save
      redirect_to registry_steps_path
    else
      flash[:error] =  @registry.errors.full_messages.to_sentence
      redirect_to new_registry_path
    end  
  end

  # PATCH/PUT /registries/1
  # PATCH/PUT /registries/1.json
  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to @registry, notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to registries_url, notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_service
    @registry = Registry.find(current_user.current_registry_id)
    @registry.add_service(service_params[:service_id].to_i, service_params[:increments].to_i)
    respond_to do |format|
      format.html { redirect_to services_path, notice: 'Successfully added service.' }
      format.json { render :show, status: :ok, location: @registry }
    end 
  end 

  def search
    unless params[:q].nil?
      @registries = Registry.search(params[:q]).records
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_params
      params.require(:registry).permit(:name, :address, :due_date, :num_child, :child_number, :gender, :email, 
        :phone_number, :shower_date, :shower_or_sprinkle, :address, :cards_ordered, :slug, 
        :accepts_wepay, :accepts_check)
    end

    def service_params
      params.permit(:increments, :service_id)
    end 
end
