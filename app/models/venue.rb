class Venue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :name, :uniqueness => { :scope => [:state, :city, :address] }

  validates :name, :presence => true

end
