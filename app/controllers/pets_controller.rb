class PetsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @pet.to_json(methods: :photo_url)}
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    user = User.find(current_user)
    @pet = Pet.new(entry_params)

    if user.pets << @pet
      redirect_to root_path,
                  flash: { success: "Pet has been saved successfully."}
    else
      render 'new', flash: { error: "Pet has not been saved."}
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    user = User.find(@pet.user_id)
    if user != current_user
      redirect_to root_path, flash: { error: "Only owner can delete its pet" }
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(entry_params)
       redirect_to root_path,
                   flash: { :success => "Pet has been updated successfully." }
    else
      redirect_to root_path, :flash => { :error => "Pet has not been updated." }
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    user = User.find(pet.user_id)
    if user == current_user
      pet.destroy
      redirect_to root_path,
                  flash: { success: "Pet has been deleted successfully."}
    else
      redirect_to root_path, flash: { error: "Only owner can delete its pet" }
    end
  end

  private
  def entry_params
    params.require(:pet).permit(:name, :age, :breed, :photo)
  end
end
