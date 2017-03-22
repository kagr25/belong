class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :num1
      t.integer :num2
      t.integer :status
      t.integer :sum

      t.timestamps null: false
    end
  end
end
