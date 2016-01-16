class PetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(entry_params)

    if @pet.save
      redirect_to root_path, flash: { success: "Pet has been saved successfully."}
    else
      render 'new', flash: { success: "Pet has not been saved."}
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_path, flash: { success: "Concert has been deleted successfully."}
  end

  private
  def entry_params
    params.require(:pet).permit(:name, :age, :breed, :photo)
  end
end
