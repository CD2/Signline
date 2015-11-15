class ProductImportsController < ApplicationController
  before_action :get_file, only: [:confirm_import, :process_import]

  def new
    @product_import = ProductImport.new
  end

  def create
    @product_import = ProductImport.new(product_import_params)
    if @product_import.save
      redirect_to product_import_confirm_import_path @product_import
    else
      render :new
    end
  end

  def confirm_import
  end

  def process_import
    Resque.enqueue(ProductImporter, @product_import.id)
    redirect_to admin_products_path
  end

  private

    def get_file
      @product_import = ProductImport.find(params[:product_import_id])
      filename ||= "#{Rails.root}/public#{@product_import.file.url}"
      @file = Nokogiri::XML(File.open(filename))
    end

    def product_import_params
      params.require(:product_import).permit(:file)
    end
end
