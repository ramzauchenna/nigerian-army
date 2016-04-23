class AddPapersToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :paper, :jsonb, null: false, default: '{}'
    add_index  :applicants, :paper, using: :gin
  end
end
