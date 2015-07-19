class ItemsController < ApplicationController

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  
  def new
    @item = Item.new
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to action: 'index', notice: 'Item was successfully created.' }
      #    format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def delete
    @item.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:url, :title)
  end

end
