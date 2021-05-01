class FlatsController < ApplicationController
  def index
    @location = params[:location]

    @flats = Flat.all

    if @location.present?
      @flats = @flats.near(@location)
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(form_params)

    if @flat.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat = Flat.destroy
    redirect_to root_path
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(form_params)
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  def form_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
