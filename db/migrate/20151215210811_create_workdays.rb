class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.integer :user_id
      t.integer :project_id
      t.date :dayDate
      t.decimal :hoursWorked
      t.text :notes

      t.timestamps null: false
    end
  end
end
