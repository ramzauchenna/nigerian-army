class AddCentresToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :centre, :string
    add_column :applicants, :zone, :string
  end
end
