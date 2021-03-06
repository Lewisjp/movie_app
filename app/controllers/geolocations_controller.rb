class GeolocationsController < ActionController::Base
  
     layout 'application'


  def index
    if params[:search].present?
      @locations = Geolocation.near(params[:search], 0.50, :order => :distance )
    else
      @locations = Geolocation.limit(5)
    end

    # if the index returns false for search, it will use these items
    @preview = Geolocation.find(rand(208))
    @movieAPIdata = Api.new(@preview.scenes.pluck(:title))

  end

  def show
    @location = Geolocation.find(params[:id])
    @movieAPIdata = Api.new(@location.scenes.pluck(:title))
    
  end

  def new
    @location = Geolocation.new
  end

  def edit
    @location = Geolocation.find(params[:id])
  end

  def create
    @location = Geolocation.new(params[:geolocation])
    @scene = Scene.new(:title => params[:title])
    @location.scenes << @scene
    @location.save
    @scene.save

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully create.'}
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new"}
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @location = Geolocation.find(params[:id])

    respond_to do |format|
      if @location.update_attribute(params[:geolocation])
        format.html { redirect_to @location, notice: 'Location was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = Geolocation.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to geolocation_url }
      format.json { head :no_content }
    end
  end
end

