class AddJobIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :jobID, :string
  end
end
