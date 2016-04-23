class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :applicant_id
      t.string :name
      t.integer :qualification_id
      t.date :start_date
      t.date :end_date
      t.string :level

      t.timestamps null: false
    end
  end
end
