class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: [:show, :edit, :update, :destroy]

  def index
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)

    if @enquiry.save
      redirect_to thanks_enquiries_path
    else
      render :new
    end
  end

  private

    def enquiry_params
      params.require(:enquiry).permit(:name, :email, :body)
    end

end
