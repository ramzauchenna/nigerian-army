class Subject < ActiveRecord::Base
  has_many :results
  has_many :applicants, through: :results
end
