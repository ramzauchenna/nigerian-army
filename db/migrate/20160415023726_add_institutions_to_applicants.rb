class AddInstitutionsToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :institutions, :jsonb, null: false, default: '{}'
    add_index :applicants, :institutions, using: :gin
  end
end
