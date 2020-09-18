class PhotosController < ApplicationController

  def top
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def create
  	@photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

end
