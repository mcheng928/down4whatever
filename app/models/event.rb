class Event < ApplicationRecord
  # Direct associations

  has_many   :choices,
             :dependent => :destroy

  has_many   :invites,
             :dependent => :destroy

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :start, :uniqueness => { :scope => [:host_id] }

  validates :start, :presence => true

  validates :title, :presence => true

end
