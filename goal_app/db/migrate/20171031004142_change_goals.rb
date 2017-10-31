class ChangeGoals < ActiveRecord::Migration[5.1]
  def change
    remove_column :goals, :public
    add_column :goals, :hidden, :boolean
  end
end
