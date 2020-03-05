class CartsController < ApplicationController
  require 'securerandom'
  require 'digest'
  include CurrentCart

  before_action :set_cart, only: [:index, :show, :edit, :update, :destroy, :send_confirm_order, :confirm_auth]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts
  # GET /carts.json
  def index
    # @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {head :no_content}
      format.js {render layout: false}
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    if @cart.id == session[:cart_id]
      @cart.destroy
      session[:cart_id] = nil
    end
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_confirm_order

  end

  def confirm_auth

  end

  def confirm_email
    
  end

  private

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to '/', notice: 'Invalid cart'
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:token_key, :string, :email, :tag)
    end
end
