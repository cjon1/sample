# == Schema Information [nb: this info is provided by the 'annotate' gem. See text on 'Model annotation' after 6.1.2 (bits inside [] written by CJ) ]
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  
  #before_save { |user| user.email = email.downcase }
  # [Note: the 3 lines above & below seem to do mostly the same thing i.e. = alternate syntax ] [all pass the tests]
  before_save { |user| user.email.downcase! }
  #before_save { email.downcase! }
  
  validates :name,  presence: true, length: { maximum: 50 }

  validates :email, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # VALID_EMAIL_REGEX is being set as a constant
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  uniqueness: { case_sensitive: false }
  
  
  validates :password, presence: true, length: {minimum: 6 }
  
  validates :password_confirmation, presence: true
  
end
