class AddSubjectgradesToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :subject_1, :integer
    add_column :applicants, :grade_1, :string
    add_column :applicants, :subject_2, :integer
    add_column :applicants, :grade_2, :string
    add_column :applicants, :subject_3, :integer
    add_column :applicants, :grade_3, :string
    add_column :applicants, :subject_4, :integer
    add_column :applicants, :grade_4, :string
    add_column :applicants, :subject_5, :integer
    add_column :applicants, :grade_5, :string
    add_column :applicants, :subject_6, :integer
    add_column :applicants, :grade_6, :string
  end
end
