class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :number
      t.string :title

      t.timestamps
    end
  end
end
