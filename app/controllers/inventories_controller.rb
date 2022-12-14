class InventoriesController < ApplicationController
  before_action :must_be_logged_in
  before_action :set_inventory, only: %i[ show edit update destroy ]

  def buy
    @item_id = params[:id]
    @user_id = session[:user_id]
    @price = Item.where(id: @item_id).first.price
    @timestamp = Time.now()

    @myItem = Item.where(id: @item_id).first
    @myItem.stock = @myItem.stock - 1

    if (@myItem.stock < 0) 
      redirect_to "/shop/#{params[:prev]}", notice: "Number of this product is zero ;-;"
    else 
      @inventory = Inventory.new
      @inventory.user_id = @user_id
      @inventory.item_id = @item_id
      @inventory.price = @price
      @inventory.timestamp = @timestamp
      @inventory.save

      @myItem.save
      redirect_to "/shop/#{params[:prev]}", notice: "Add to shpping cart succesfully"
    end
  end






  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:user_id, :item_id, :price, :timestamp, :Time)
    end
end
