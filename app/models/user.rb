class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :competition
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :role, :competition
  
  validates_presence_of :username
  
  def has_role?(role_sym)
    roles.any? { |r| r.username.underscore.to_sym == role_sym }
  end
end
