class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :description
      t.integer :likes

      t.timestamps null: false
    end
  end
end
