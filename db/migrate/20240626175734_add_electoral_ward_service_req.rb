class AddElectoralWardServiceReq < ActiveRecord::Migration[7.1]
  def change
    add_reference :service_requests, :electoral_ward, null: false, foreign_key: true
  end
end
