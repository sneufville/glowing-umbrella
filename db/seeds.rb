# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

# Clear database tables
ServiceRequest.destroy_all
ServiceArea.destroy_all
ElectoralWard.destroy_all

# Load CSV data
electoral_ward_csv = Rails.root.join('db/electoral_ward_data.csv')
electoral_ward_data = File.read(electoral_ward_csv)

service_data_csv = Rails.root.join('db/311_service_request_data.csv')
service_req_data = File.read(service_data_csv)

wards = CSV.parse(electoral_ward_data, headers: true)
service_requests = CSV.parse(service_req_data, headers: true)

# create electoral wards
wards.each do |ward|
  ElectoralWard.create!(
    name: ward['Name']
  )
end

count = 0
# create service areas and service requests (the first 250 entries only)
service_requests.each do |service_request_obj|
  # break out of the loop since we only want a subset of records
  break if count >= 250

  # skip the record if we find nil values
  next if service_request_obj['Service Area'].nil? || service_request_obj['Ward'].nil?

  puts "iteration # #{count}"

  # look up service area or create it
  service_area = ServiceArea.find_or_create_by!(name: service_request_obj['Service Area'])

  # look up electoral ward or create it
  electoral_ward = ElectoralWard.find_or_create_by!(name: service_request_obj['Ward'])

  # create service request
  ServiceRequest.create!(
    service_area: service_area,
    service_request: service_request_obj['Service Request'],
    electoral_ward: electoral_ward,
    neighbourhood: service_request_obj['Neighbourhood'],
    location: service_request_obj['Location 1'],
    date: service_request_obj['Date']
  )

  count += 1
end
