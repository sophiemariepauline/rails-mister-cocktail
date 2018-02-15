class DosesController < ApplicationController



  def dose_create
    @dose = Cocktail.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
  end


private
  def dose_params
    dose_params = params.require(:dose).permit(:description, :cocktail, :ingredient)
  end

end
