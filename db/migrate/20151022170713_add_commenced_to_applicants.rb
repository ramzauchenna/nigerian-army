class AddCommencedToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :commenced, :boolean
  end
end
