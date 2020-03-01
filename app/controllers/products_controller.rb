class ProductsController < ApplicationController
  require 'will_paginate/array'
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(category_id: params[:category_id])
    @products = @products.paginate(page: params[:page], per_page: 3)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to category_product_path(@product.category, @product.id), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to category_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    search_text = params[:search_text]

    if search_text.present?
      @products = Product.all
    else
      @products = Product.where('name LIKE ? OR content LIKE ? OR tags LIKE ?', "%#{search_text}%", "%#{search_text}%", "%#{search_text}%").order('created_at DESC')
    end

    if @products.present?
      @products = @products.paginate(page: params[:page], per_page: 8)
    end

    respond_to do |format|
      format.js {}
    end
  end

  def price_up
    @products = Product.all.order('price ASC')

    @products = @products.paginate(page: params[:page], per_page: 8)

    respond_to do |format|
      format.js {}
    end
  end

  def price_down
    @products = Product.all.order('price DESC')

    @products = @products.paginate(page: params[:page], per_page: 8)

    respond_to do |format|
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :content, :price, :buyer, :data_file, :manufacturer, :category_id, :published, :tags, :langugage, :slug)
    end
end
