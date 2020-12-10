class Server < ApplicationRecord
  belongs_to :user
  belongs_to :package
  has_many :domains
  paginates_per 10
end
