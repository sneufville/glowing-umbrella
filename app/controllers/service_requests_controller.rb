class ServiceRequestsController < ApplicationController
  def index
    @service_requests = ServiceRequest.includes(:electoral_ward, :service_area).all
  end
end
