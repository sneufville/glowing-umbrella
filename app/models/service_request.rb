class ServiceRequest < ApplicationRecord
  # model relationships
  belongs_to :service_area
  belongs_to :electoral_ward
end
