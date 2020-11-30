class Tag < ApplicationRecord
  paginates_per 10
  has_many :concept_tags
  has_many :concepts, through: :concept_tags
  validates_uniqueness_of :name
  validates_presence_of :name
end
