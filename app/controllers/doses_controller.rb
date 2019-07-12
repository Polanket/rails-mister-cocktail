class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)

    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
