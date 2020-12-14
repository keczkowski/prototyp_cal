class Server < ApplicationRecord
  belongs_to :user
  belongs_to :package
  has_many :domains
  has_many :u_ftps
  has_many :u_dbs
  has_many :u_emails
  paginates_per 10
end
