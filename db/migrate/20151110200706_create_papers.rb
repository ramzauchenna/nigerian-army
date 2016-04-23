class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :applicant_id
      t.string :subject
      t.string :grade
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
