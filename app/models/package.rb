class Package < ApplicationRecord
  has_many :servers
  paginates_per 10
end
