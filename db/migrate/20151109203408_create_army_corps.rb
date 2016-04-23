class CreateArmyCorps < ActiveRecord::Migration
  def change
    create_table :army_corps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
