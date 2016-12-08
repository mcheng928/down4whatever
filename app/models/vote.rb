class Vote < ApplicationRecord
  # Direct associations

  belongs_to :guest,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :choice_id, :uniqueness => { :scope => [:guest_id] }

  validates :choice_id, :presence => true

  validates :guest_id, :uniqueness => { :scope => [:choice_id] }

  validates :guest_id, :presence => true

end
