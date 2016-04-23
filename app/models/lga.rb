class Lga < ActiveRecord::Base

  def self.compact
    Lga.select(:id, :name, :state)
  end
end
