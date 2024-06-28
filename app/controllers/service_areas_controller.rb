class ServiceAreasController < ApplicationController
  def index
    @service_areas = ServiceArea.all
    @related_counts = ServiceRequest.group(:service_area).count
    @total_count = ServiceArea.count
  end
end
