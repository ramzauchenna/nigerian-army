class Region < ActiveRecord::Base
	cattr_accessor :listing, instance_writer: false do 
		%w(Anambra Akwa\ Ibom Adamawa Abia Bauchi Bayelsa Benue Borno Cross\ River Delta Ebonyi Edo Ekiti Enugu FCT Gombe Imo Jigawa Kaduna Kano Katsina Kebbi Kogi Kwara Lagos Nasarawa Niger Ogun Ondo Osun Oyo Plateau Rivers Sokoto Taraba Yobe Zamfara
)		
	end 

  def self.hashed(initial_value = 0)
    h = Hash.new
    self.listing.each do |r|
      h[r] = initial_value
    end
    h
  end



end
