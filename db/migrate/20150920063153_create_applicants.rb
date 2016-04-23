class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :surname
      t.string :oname
      t.string :email
      t.string :phone_number
      t.string :additional_number
      t.string :address
      t.string :city
      t.string :country
      t.string :doc
      t.string :post_code
      t.integer :user_id
      t.string :application_number
      t.string :picture
      t.string :army_corp
      t.text :specialization
      t.integer :exam_centre_id
      t.string :title
      t.date :dob
      t.string :sob
      t.string :town
      t.integer :lga_o_origin_id
      t.integer :state_of_origin_id
      t.float :height
      t.string :gender
      t.string :religion
      t.string :marital_status
      t.integer :no_of_children
      t.integer :residential_address_id
      t.integer :contct_address_id
      t.string :hobbies
      t.boolean :tribal_marks
      t.boolean :tattoo
      t.string :nok_fullname
      t.string :nok_relationship
      t.integer :nok_contact_address_id
      t.integer :nok_occupation_id
      t.string :nok_post
      t.string :nok_phone_number
      t.string :nok_email
      t.string :parent_fullname
      t.integer :parent_address_id
      t.string :parent_phone_number
      t.string :parent_email
      t.boolean :served
      t.text :served_details
      t.text :served_leaving_reason
      t.boolean :police_detained
      t.text :police_detained_reason
      t.string :police_detained_duration
      t.boolean :conviction
      t.text :conviction_reason
      t.text :conviction_details
      t.boolean :travel
      t.text :travel_details

      t.timestamps null: false
    end
  end
end
