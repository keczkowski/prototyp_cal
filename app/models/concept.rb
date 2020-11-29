class Concept < ApplicationRecord
  paginates_per 10
  has_many :concept_tags
  has_many :tags, through: :concept_tags

  belongs_to :user
end
