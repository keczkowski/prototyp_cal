class Domain < ApplicationRecord
  belongs_to :user
  belongs_to :server
end
