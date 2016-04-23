class CreateSpecializations < ActiveRecord::Migration
  def change
    create_table :specializations do |t|
      t.string :name
      t.integer :army_corp_id

      t.timestamps null: false
    end
  end
end
