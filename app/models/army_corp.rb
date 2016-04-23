class ArmyCorp < ActiveRecord::Base
  has_many :specializations, dependent: :destroy
end
