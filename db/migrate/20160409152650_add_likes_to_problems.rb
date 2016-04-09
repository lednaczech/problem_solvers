class AddLikesToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :likes, :integer
  end
end
