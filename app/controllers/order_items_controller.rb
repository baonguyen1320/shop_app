class OrderItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create, :destroy, :increment_quantity, :decrement_quantity]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy, :increment_quantity, :decrement_quantity]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @cart.add_item(params[:product_id])
    @cart.updated_at = Time.now
    @cart.save

    respond_to do |format|
      if @order_item.save
        format.html {redirect_to '/'}
        format.js {
          @current_item = @order_item
        }
        format.json {render :show, status: :created, location: @order_item}
      else
        format.html {render :new}
        format.json {render json: @order_item.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    if @cart.order_items.count == 1 && @cart.id == session[:cart_id]
      @cart.destroy
      session[:cart_id] = nil
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Cart was successfully destroyed.' }
        format.json { head :no_content }
      end
    elsif @cart.order_items.include?(@order_item)
      @order_item.destroy 
      @cart.updated_at = Time.now
      @cart.save
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Order item was successfully destroyed.' }
        format.json { head :no_content }
        format.js { render layout: false }
      end
    end
  end

  def increment_quantity
    @order_item.quantity += 1
    @order_item.save

    respond_to do |format|
      format.js {
        @cart.updated_at = Time.now
        @cart.save
        render layout: false
      }
    end
  end

  def decrement_quantity
    @order_item.quantity -= 1 if @order_item.quantity >= 2
    @order_item.save

    respond_to do |format|
      format.js {
        @cart.updated_at = Time.now
        @cart.save
        render layout: false
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity, :cart_id, :order_id)
    end
end
