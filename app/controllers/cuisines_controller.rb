class CuisinesController < ApplicationController
  def show
   id = params[:id]
   @cuisine = Cuisine.find(id)
  end
  def new
    @cuisine = Cuisine.new
  end
  def create
    cuisine_params = params.require(:cuisine).permit(:name)

    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:error] = "Você deve informar o nome da cozinha"
      render :new
    end

  end
end
