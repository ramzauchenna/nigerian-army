class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :applicant_id
      t.date :start_date
      t.date :end_date
      t.string :institution
      t.string :degree
      t.string :course
      t.string :specialization
      t.string :location
      t.string :country

      t.timestamps null: false
    end
  end
end
