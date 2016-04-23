class User < ActiveRecord::Base
  # include Authority::UserAbilities
  rolify
	has_one :applicant, dependent: :destroy, inverse_of: :user


  # Include default devise modules. Others available are:
  #   :rememberable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,  :timeoutable, 
         :recoverable,  :trackable, :validatable
end
