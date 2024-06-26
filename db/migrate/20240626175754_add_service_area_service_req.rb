class AddServiceAreaServiceReq < ActiveRecord::Migration[7.1]
  def change
    add_reference :service_requests, :service_area, null: false, foreign_key: true
  end
end
