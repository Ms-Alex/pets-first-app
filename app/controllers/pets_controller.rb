class PetsController < ApplicationController
  before_action :fetch_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to pet_path(@pet)
  end

  def edit
  end

  def update
    @pet.update(update_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end


  private
  def fetch_pet
    #fetches id from url
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :owner_id)
  end

  def update_params
    params.require(:pet).permit(:name, :owner_id)
  end

end
