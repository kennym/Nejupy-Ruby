class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :competition
  has_many :solutions
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :role, :competition
  
  validates_presence_of :username
  validates_presence_of :role

  def has_role?(role)
    if @role.name == role
      return true
    end
    return false
  end
  
end
