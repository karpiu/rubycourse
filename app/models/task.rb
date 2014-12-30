class Task < ActiveRecord::Base
  belongs_to :milestone
  has_many :student_tasks
end
