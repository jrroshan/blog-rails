class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy, :update, :edit]

  def index
    #   Get All the Image from database
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to(@image, notice: 'Image was successfully created.')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to(@image, notice: 'Image was successfully updated.')
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @image.destroy

    redirect_to(images_path, notice: 'Image was successfully destroyed.')
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
