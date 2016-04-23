class AddRefereeToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :referee1_fullname, :string
    add_column :applicants, :referee1_phone_number, :string
    add_column :applicants, :referee1_contact_address, :text
    add_column :applicants, :referee2_fullname, :string
    add_column :applicants, :referee2_phone_number, :string
    add_column :applicants, :referee2_contact_address, :text
    add_column :applicants, :referee3_fullname, :string
    add_column :applicants, :referee3_phone_number, :string
    add_column :applicants, :referee3_contact_address, :text
  end
end
