class ConceptTag < ApplicationRecord
  belongs_to :concept
  belongs_to :tag
end
