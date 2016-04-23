class Result < ActiveRecord::Base
  has_many :subjects
  has_many :applicants
end
