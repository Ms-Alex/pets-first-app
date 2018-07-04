class OwnersController < ApplicationController
  before_action :fetch_owner, only: [:show, :edit, :update, :destroy]

  def index
    @owners = Owner.all
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.save
    redirect_to @owner
    # redirect_to owner_path(@owner)
  end

  def edit

  end

  def update

  end

  def destroy
    @owner.pets.each do |pet|
      pet.destroy
    end
    @owner.destroy
    redirect_to owners_path
  end


  private
  def fetch_owner
    #fetches id from url
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:name)
  end

end
