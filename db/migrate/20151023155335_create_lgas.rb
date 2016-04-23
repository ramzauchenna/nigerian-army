class CreateLgas < ActiveRecord::Migration
  def change
    create_table :lgas do |t|
      t.string :name
      t.string :state

      t.timestamps null: false
    end
  end
end
