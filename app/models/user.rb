class User < ApplicationRecord
  # Direct associations

  has_many   :invites,
             :foreign_key => "guest_id",
             :dependent => :destroy

  has_many   :events,
             :foreign_key => "host_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :phone, :uniqueness => true

  validates :phone, :presence => true

  validates :phone, :length => { :minimum => 7, :maximum => 7 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
