class Cities::WeathersController < ApplicationController
    before_action :set_weather, only: [:show, :edit, :update, :destroy]
    before_action :set_city
  
    # GET /weathers/new
    def new
      @weather = Weather.new
      @button_text = "Crear"
    end
  
    # GET /weathers/1/edit
    def edit
      @button_text = "Actualizar"
    end
  
    # POST /weathers
    # POST /weathers.json
    def create
      @weather = Weather.new(weather_params)
      @weather.city = @city
  
      respond_to do |format|
        if @weather.save
          format.html { redirect_to @city, notice: 'Temperatura añadida correctamente.'}
          format.json { render :show, status: :created, location: @city }
        else
          format.html { render :new }
          format.json { render json: @weather.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /weathers/1
    # PATCH/PUT /weathers/1.json
    def update
      respond_to do |format|
        if @weather.update(weather_params)
          format.html { redirect_to @city, notice: 'Temperatura actualizada correctamente.' }
          format.json { render :show, status: :ok, location: @city }
        else
          format.html { render :edit }
          format.json { render json: @weather.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /weathers/1
    # DELETE /weathers/1.json
    def destroy
      @weather.destroy
      respond_to do |format|
        format.html { redirect_to @city, notice: 'Temperatura eliminada correctamente.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_weather
        @weather = Weather.find(params[:id])
      end

      def set_city
        @city = City.find(params[:city_id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def weather_params
        params.require(:weather).permit(:temp)
      end
  end
  