class ElectoralWard < ApplicationRecord
  # model relationships
  has_many :service_request

  # validations
  validates :name, presence: true
end
