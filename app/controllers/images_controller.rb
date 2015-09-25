class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :upload
  def upload
    if params[:file]
      @image = Image.create(image: params[:file])
    end
    render json: {link: "http://lvh.me:3000#{@image.image}"}
  end

end
