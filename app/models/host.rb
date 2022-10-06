class Host < ApplicationRecord
  belongs_to :region

  scope :filter_by_name, -> (name) { where('name ILIKE ?', "%#{name}%") }
end
