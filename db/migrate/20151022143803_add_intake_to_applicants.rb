class AddIntakeToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :intake, :string
  end
end
