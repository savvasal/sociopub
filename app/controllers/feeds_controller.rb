class FeedsController < ApplicationController

  # GET /items
  # GET /items.json
  def index
    @feeds = Feed.all
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
  end


  
  def new
    @feed = Feed.new
  end

  # POST /items
  # POST /items.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to action: 'index', notice: 'Feed was successfully created.' }
      #    format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def delete
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feed_params
    params.require(:feed).permit(:url)
  end

end
