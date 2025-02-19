class ServiceRequestsController < ApplicationController
  include Pagy::Backend
  def index
    @electoral_wards = ElectoralWard.all
    @service_areas = ServiceArea.all

    service_request_title = params[:title] || nil
    service_area_id = params[:sa] || nil
    if service_area_id == ''
      service_area_id = nil
    end
    electoral_ward_id = params[:ew] || nil
    if electoral_ward_id == ''
      electoral_ward_id = nil
    end
    filter_condition = ["service_request like ?", "%#{service_request_title}%"]
    if service_area_id
      filter_condition = ["service_request like ? AND service_area_id = ?", "%#{service_request_title}%", service_area_id]
    elsif electoral_ward_id
      filter_condition = ["service_request like ? AND electoral_ward_id = ?", "%#{service_request_title}%", electoral_ward_id]
    elsif electoral_ward_id && service_area_id
      filter_condition = ["service_request like ? AND electoral_ward_id = ? AND service_area_id", "#{service_request_title}", electoral_ward_id, service_area_id]
    end

    @count = ServiceRequest.where(filter_condition).count
    @pagy, @service_requests = pagy(ServiceRequest.includes(:electoral_ward, :service_area).where(filter_condition))
  end

  def show
    begin
      @service_request = ServiceRequest.includes(:service_area, :electoral_ward).find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @error = "Resource Not Found!"
    end
  end
end
