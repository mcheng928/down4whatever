class Venue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:state, :city, :address] }

  validates :name, :presence => true

end
