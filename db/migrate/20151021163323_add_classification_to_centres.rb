class AddClassificationToCentres < ActiveRecord::Migration
  def change
    add_column :centres, :classification, :string
  end
end
