class AddWorkflowStateToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :workflow_state, :string
  end
end
