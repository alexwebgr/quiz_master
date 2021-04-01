class SubscriptionStatusesController < ApplicationController
  before_action :set_subscription_status, only: [:show, :edit, :update, :destroy]

  # GET /subscription_statuses
  def index
    @subscription_statuses = SubscriptionStatus.all
  end

  # GET /subscription_statuses/1
  def show
  end

  # GET /subscription_statuses/new
  def new
    @subscription_status = SubscriptionStatus.new
  end

  # GET /subscription_statuses/1/edit
  def edit
  end

  # POST /subscription_statuses
  def create
    @subscription_status = SubscriptionStatus.new(subscription_status_params)

    if @subscription_status.save
      redirect_to @subscription_status, notice: 'Subscription status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subscription_statuses/1
  def update
    if @subscription_status.update(subscription_status_params)
      redirect_to @subscription_status, notice: 'Subscription status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subscription_statuses/1
  def destroy
    @subscription_status.destroy
    redirect_to subscription_statuses_url, notice: 'Subscription status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_status
      @subscription_status = SubscriptionStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_status_params
      params.require(:subscription_status).permit(:label, :handle)
    end
end
