class Choice < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :event_id, :presence => true

  validates :venue_id, :uniqueness => { :scope => [:event_id] }

  validates :venue_id, :presence => true

end
