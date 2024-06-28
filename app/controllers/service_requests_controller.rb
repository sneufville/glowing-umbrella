class ServiceRequestsController < ApplicationController
  def index
    @service_requests = ServiceRequest.includes(:electoral_ward, :service_area).all
  end

  def show
    begin
      @service_request = ServiceRequest.find(params[:id], :include => [:electoral_ward, :service_area])
    rescue ActiveRecord::RecordNotFound => e
      @error = "Resource Not Found!"
    end
  end
end
