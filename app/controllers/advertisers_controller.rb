class AdvertisersController < ApplicationController
  before_action :set_advertiser, only: [:show, :edit, :update, :destroy, :subscribe, :unsubscribe, :subscribers, :details, :events]

  def details
  end

  def subscribe
    if @advertiser.p_type == 'Public'
      @status = Status.where(scope_type: 'Subscription', end_point: true).first
    else
      @status = Status.where(scope_type: 'Subscription', start_point: true).first
    end
    @subscription = Subscription.create(user_id: current_user.id, advertiser_id: @advertiser.id, status_id: @status.id)
  end

  def unsubscribe
    #@status = Status.where(scope_type: 'Subscription', start_point: true).first
    @subscription = Subscription.where(user_id: current_user.id, advertiser_id: @advertiser.id).first
    @subscription.destroy
  end


  def subscribers
    @subscriptions = Subscription.where(advertiser_id: @advertiser.id)
  end

  def events
  end

  # GET /advertisers
  # GET /advertisers.json
  def index
    @advertisers = Advertiser.all
  end

  # GET /advertisers/1
  # GET /advertisers/1.json
  def show
  end

  # GET /advertisers/new
  def new
    @advertiser = Advertiser.new
  end

  # GET /advertisers/1/edit
  def edit
    @upload_ids = Upload.where(uploadable_type: 'Advertiser', uploadable_id: @advertiser.id).pluck(:id)
  end

  # POST /advertisers
  # POST /advertisers.json
  def create
    @advertiser = Advertiser.new(advertiser_params)

    respond_to do |format|
      if @advertiser.save
        manage_uploads(@advertiser)
        format.html { redirect_to @advertiser, notice: 'Advertiser was successfully created.' }
        format.json { render :show, status: :created, location: @advertiser }
      else
        format.html { render :new }
        format.json { render json: @advertiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisers/1
  # PATCH/PUT /advertisers/1.json
  def update
    respond_to do |format|
      if @advertiser.update(advertiser_params)
        manage_uploads(@advertiser)
        format.html { redirect_to @advertiser, notice: 'Advertiser was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertiser }
      else
        format.html { render :edit }
        format.json { render json: @advertiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisers/1
  # DELETE /advertisers/1.json
  def destroy
    @advertiser.destroy
    respond_to do |format|
      format.html { redirect_to advertisers_url, notice: 'Advertiser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_advertiser
    @advertiser = Advertiser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def advertiser_params
    params.require(:advertiser).permit(:uuid, :title, :details, :p_type)
  end
end
