class PhotosController < ApplicationController
  def index
    @photos = Photo.order(created_at: :desc)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      save_image_to_disk(@photo)
      redirect_to photos_path, notice: '写真がアップロードされました。'
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path, notice: 'Photo was successfully deleted.'
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image_url)
  end

  def save_image_to_disk(photo)
    image = params[:photo][:image_url]
    File.binwrite(photo.image_path, image.read) if image.present?
  end
end