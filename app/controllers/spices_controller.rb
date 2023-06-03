class SpicesController < ApplicationController
  def index
    spice = Spice.all
    render json: spice, status: :ok
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find_by(params[:id])
    spice.update(spice_params)
    render json: spice, status: :ok
  end

  def destroy
    spice = Spice.find_by(params[:id])
    spice.destroy
    render json: {}, status: :no_content
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

end
