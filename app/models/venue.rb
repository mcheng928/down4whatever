class Venue < ApplicationRecord
  # Direct associations

  has_many   :choices,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :name, :uniqueness => { :scope => [:state, :city, :address] }

  validates :name, :presence => true

end
