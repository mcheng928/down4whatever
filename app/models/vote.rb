class Vote < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :choice_id, :presence => true

  validates :guest_id, :uniqueness => { :scope => [:choice_id] }

  validates :guest_id, :presence => true

end
