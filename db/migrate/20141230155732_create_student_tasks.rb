class CreateStudentTasks < ActiveRecord::Migration
  def change
    create_table :student_tasks do |t|
      t.references :student, index: true
      t.references :task, index: true
      t.integer :state

      t.timestamps
    end
  end
end
