class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :wikis
  
  has_many :collaborators
  has_many :wikis, through: :collaborators
  
  before_save { self.role ||= :standard }
  
  
  
  
  
  
  enum role: [:standard, :premium, :admin]

end
