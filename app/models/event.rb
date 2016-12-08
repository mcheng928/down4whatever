class Event < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :start, :uniqueness => { :scope => [:host_id] }

  validates :start, :presence => true

  validates :title, :presence => true

end
