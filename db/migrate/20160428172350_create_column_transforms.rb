class CreateColumnTransforms < ActiveRecord::Migration
  def change
    create_table :column_transforms do |t|
      t.string :external
      t.string :internal

      t.timestamps null: false
    end
  end
end
