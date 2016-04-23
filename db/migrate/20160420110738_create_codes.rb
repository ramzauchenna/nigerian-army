class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :full
      t.string :abbr

      t.timestamps null: false
    end
  end
end
