class RegistryTypesController < ApplicationController
  before_action :set_registry_type, only: [:show, :edit, :update, :destroy]

  # GET /registry_types
  # GET /registry_types.json
  def index
    @registry_types = RegistryType.all
  end

  # GET /registry_types/1
  # GET /registry_types/1.json
  def show
  end

  # GET /registry_types/new
  def new
    @registry_type = RegistryType.new
  end

  # GET /registry_types/1/edit
  def edit
  end

  # POST /registry_types
  # POST /registry_types.json
  def create
    @registry_type = RegistryType.new(registry_type_params)

    respond_to do |format|
      if @registry_type.save
        format.html { redirect_to @registry_type, notice: 'Registry type was successfully created.' }
        format.json { render :show, status: :created, location: @registry_type }
      else
        format.html { render :new }
        format.json { render json: @registry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registry_types/1
  # PATCH/PUT /registry_types/1.json
  def update
    respond_to do |format|
      if @registry_type.update(registry_type_params)
        format.html { redirect_to @registry_type, notice: 'Registry type was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry_type }
      else
        format.html { render :edit }
        format.json { render json: @registry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registry_types/1
  # DELETE /registry_types/1.json
  def destroy
    @registry_type.destroy
    respond_to do |format|
      format.html { redirect_to registry_types_url, notice: 'Registry type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry_type
      @registry_type = RegistryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_type_params
      params.require(:registry_type).permit(:name)
    end
end
