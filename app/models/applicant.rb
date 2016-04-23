class Applicant < ActiveRecord::Base
  resourcify

  validates :first_name, :surname, :phone_number, :picture, presence: true
  validates :intake, :centre, presence: true
  validate :intake_1_should_have_army_corp_and_specialization
  validates :dob, :sob, :town, :height, :gender, :religion, :residential_address, :lga, :sor, :parent_address, presence: true
  validates :tattoo, :tribal_marks, inclusion: { in: [true, false]}
  validates :no_of_children, :marital_status, :contact_address,   presence: true
  validates :nok_fullname, :nok_relationship, :nok_post, :nok_phone_number, :nok_occupation, :nok_contact_address, presence: true
  validates :parent_fullname, :parent_address, :parent_phone_number, :hobbies,    presence: true
  validates :served, :police_detained, :travel,  inclusion: { in: [true, false]}
  validate :served_information
  validate :police_information
  validate :travel_information

  validates :referee1_fullname, :referee1_phone_number, :referee1_contact_address, presence: true
  validates :referee2_fullname, :referee2_phone_number, :referee2_contact_address, presence: true
  validates :referee3_fullname, :referee3_phone_number, :referee3_contact_address, presence: true 
  validates_size_of :picture, maximum: 1.megabytes, message: "picture should be less than 1MB"



  # include Authority::Abilities
  has_many :educations, dependent: :destroy
  has_many :schools, dependent: :destroy
  has_many :results
  has_many :subjects, through: :results
	belongs_to :user, inverse_of: :applicant

  accepts_nested_attributes_for :educations, :reject_if => :all_blank
  accepts_nested_attributes_for :schools, :reject_if => :all_blank

	after_commit :transit_application
 # mount_base64_uploader :picture, PictureUploader

  include Workflow

  workflow do 
  
    state :register do 
      event :submit, :transitions_to => :fill_application
      # event :revert, :transitions_to => :new
    end

    state :fill_application do 
      event :submit, :transitions_to => :fill_application
      event :chosen, :transitions_to => :pre_screening_exam
      event :revert, :transitions_to => :register
    end

    state :pre_screening_exam do 
      event :submit, :transitions_to => :zonal_screening
      event :revert, :transitions_to => :register
    end


    state :zonal_screening do 
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
      event :revert, :transitions_to => :pre_screening_exam
    end

    state :accepted do
      event :revert, :transitions_to => :zonal_screening
    end

    state :rejected do
      event :revert, :transitions_to => :zonal_screening
    end

  end

  def intake_1_should_have_army_corp_and_specialization
    unless intake == "0"
      unless army_corp.present? && specialization.present?
        errors.add(:intake, "Army Corp and Specialization is required for Tradesmen")
      end
    end
  end

  def served_information
    unless served == false
      unless served_details.present? && served_leaving_reason.present?
        errors.add(:served, "Provide details of service")
      end
    end
  end

  # # # validates :police_detained, :police_detained_reason, :police_detained_duration, presence: true
  # # # validates :conviction, :conviction_reason, :conviction_details,  presence: true
  # # # validates :travel, :travel_details,  presence: true

  def police_information
    unless police_detained == false
      unless police_detained_reason.present? && police_detained_duration.present?
        errors.add(:police_detained_reason, "Provide details of detention")        
      end
    end
  end

  def travel_information
    unless travel == false
      unless travel_details.present?
        errors.add(:travel, "Provide details of travel")        
      end
    end
  end

  def transit_application
    if self.new_record?
      submit!
    elsif self.valid? && (self.workflow_state == "register" || self.workflow_state == "fill_application")
      update_application_number
      submit!
    end
  end

	def update_application_number
 		sc = Code.where(full: sor).pluck(:abbr)[0]
    an = "75RRI/#{sc}/510/#{self.id}"
    if self.application_number.nil? || self.application_number.empty?
		  update(application_number: an)
		end
	end

  def full_name
    "#{surname} #{first_name} #{oname}"
  end
end
