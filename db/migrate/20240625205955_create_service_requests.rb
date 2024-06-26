class CreateServiceRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :service_requests do |t|
      t.timestamp :date
      t.string :service_request
      t.string :neighbourhood
      t.string :location

      t.timestamps
    end
  end
end
