class ProductsController < ApplicationController
  require 'open-uri'
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
    countries_xml = open('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml') {|f| f.read }
    countries = Hash.from_xml(countries_xml)
    @countries =countries["Envelope"]["Cube"]["Cube"][0]["Cube"]
    @countries = @countries.unshift({"currency"=>"EUR", "rate"=>""})
  end

  def show
  end 

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def convert_currency
    prices = []
    unless params[:currency] == "EUR"
      Product.pluck(:price).each do |p|
        prices << Product.exchange_currency(p, params[:currency])
      end
    else
      prices = Product.pluck(:price)
    end
    render json:{prices: prices}
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
