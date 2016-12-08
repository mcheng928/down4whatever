class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :phone, :length => { :minimum => 7, :maximum => 7 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
