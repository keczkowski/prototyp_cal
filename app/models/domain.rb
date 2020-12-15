class Domain < ApplicationRecord
  belongs_to :user
  belongs_to :server
  has_many :dns_records
  paginates_per 10
end
