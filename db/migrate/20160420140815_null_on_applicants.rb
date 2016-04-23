class NullOnApplicants < ActiveRecord::Migration
  def change
    change_column :applicants, :paper, :jsonb, null: true, default: '{}'
  end
end
