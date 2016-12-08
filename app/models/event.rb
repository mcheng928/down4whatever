class Event < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :start, :presence => true

  validates :title, :presence => true

end
