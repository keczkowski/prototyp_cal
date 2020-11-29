class Tag < ApplicationRecord
  paginates_per 10
  has_many :concept_tags
  has_many :concepts, through: :concept_tags
end
