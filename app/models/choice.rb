class Choice < ApplicationRecord
  # Direct associations

  belongs_to :venue

  belongs_to :event

  # Indirect associations

  # Validations

  validates :event_id, :uniqueness => { :scope => [:venue_id] }

  validates :event_id, :presence => true

  validates :venue_id, :uniqueness => { :scope => [:event_id] }

  validates :venue_id, :presence => true

end
