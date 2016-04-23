class CreateCentres < ActiveRecord::Migration
  def change
    create_table :centres do |t|
      t.string :code
      t.string :title
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
