class AddFieldsToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :lga, :string
    add_column :applicants, :sor, :string
    add_column :applicants, :residential_address, :text
    add_column :applicants, :contact_address, :text
    add_column :applicants, :nok_contact_address, :text
    add_column :applicants, :nok_occupation, :string
    add_column :applicants, :parent_address, :text
  end
end
