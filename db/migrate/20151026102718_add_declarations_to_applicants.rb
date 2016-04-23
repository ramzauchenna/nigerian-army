class AddDeclarationsToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :declared, :boolean
    add_column :applicants, :declared_full_name, :string
  end
end
