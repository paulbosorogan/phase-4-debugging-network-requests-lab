class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create!(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = find_by
    toy.update!(toy_params)
    render json: toy 
  end

  def destroy
    toy = find_by
    toy.destroy
    head :no_content
  end

  private
  def find_by 
    Toy.find_by(id: params[:id])
  end 
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
