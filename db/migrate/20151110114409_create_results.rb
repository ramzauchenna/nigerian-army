class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :applicant, index: true
      t.string :grade
      t.timestamps null: false
    end
  end
end
