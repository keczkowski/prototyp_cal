class Domain < ApplicationRecord
  belongs_to :user
  belongs_to :server
  paginates_per 10
end
