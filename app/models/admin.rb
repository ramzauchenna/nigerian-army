class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :rememberable, :registerable and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :trackable, :validatable
end
