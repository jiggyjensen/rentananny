class NanniesController < ApplicationController

  def index
    @nannies = Nanny.geocoded #returns flats with coordinates
      if params[:query].present?
      @nannies = Nanny.search_by_city(params[:query])
      @markers = @nannies.map do |nanny|
      {
        lat: nanny.latitude,
        lng: nanny.longitude
      }
      end
      else
        @markers = @nannies.map do |nanny|
      {
        lat: nanny.latitude,
        lng: nanny.longitude
      }
    end
    end
  end

  def show
    @nanny = Nanny.find(params[:id])
    @review = Review.new
    @markers = [{

      lat: @nanny.latitude,
      lng: @nanny.longitude
    }]
  end


  def new
    @nanny = Nanny.new
  end

  def create
    @nanny = Nanny.new(nannies_params)
    @nanny.user = current_user
    if @nanny.save
      redirect_to nanny_path(@nanny), notice: 'nanny created! Welcome'
    else
      render :new
    end
  end

  private

  def nannies_params
    params.require(:nanny).permit(:city, :description, :age, :experience_level, :price_per_hour, :certification, :photo)
  end
end
