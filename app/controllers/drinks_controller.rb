class DrinksController < ApplicationController
  # List of drinks
  def index
    @drinks = Drink.all
  end

  # Show one drink
  def show
    @drink = Drink.find(params[:id])
  end

  # display form for new record
  def new
    @drink = Drink.new
  end

  # save the new record
  def create
    @drink = Drink.new(allowed_params)

    if @drink.save
      redirect_to drinks_path
    else
      render 'new'
    end
  end

  # display form for existing record
  def edit
    @drink = Drink.find(params[:id])
  end

  # updates the existing record
  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(allowed_params)
      redirect_to drinks_path
    else
      render 'new'
    end
  end

  # delete the record
  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to drinks_path
  end

  private
    def allowed_params
      params.require(:drink).permit(:name, :size)
    end
end
