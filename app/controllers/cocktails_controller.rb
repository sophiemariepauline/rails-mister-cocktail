class CocktailsController < ApplicationController
  before_action :cocktail_display, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
    redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show

  end



  private

  def cocktail_display
    @cocktail = Cocktail.find(params[:id])
  end


  def cocktail_params
    cocktail_params = params.require(:cocktail).permit(:name)
  end

   def dose_params
      dose_params = params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end


end
