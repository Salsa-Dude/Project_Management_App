class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.datetime :due_date
      t.string :status

      t.timestamps
    end
  end
end
