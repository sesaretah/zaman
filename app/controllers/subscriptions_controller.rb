class SubscriptionsController < ApplicationController

  def change_status
    @status = Status.find(params[:status_id])
    @subscription = Subscription.find(params[:id])
    @subscription.status_id = @status.id
    @subscription.save
    @advertiser = @subscription.advertiser
  end
end
