class AddZoneToCentres < ActiveRecord::Migration
  def change
    add_column :centres, :zone, :string
  end
end
