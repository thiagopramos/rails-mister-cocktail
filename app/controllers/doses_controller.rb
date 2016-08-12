class DosesController < ApplicationController

 def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build()
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(doses_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy

    dose = Dose.find(params[:id])
    cocktail = Cocktail.find(params[:cocktail_id])
    dose.destroy

    redirect_to cocktail_path(cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:ingredient_id,:description)
  end

end
