class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
