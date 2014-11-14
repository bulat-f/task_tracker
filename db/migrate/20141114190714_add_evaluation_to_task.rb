class AddEvaluationToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :evaluation, :integer
  end
end
