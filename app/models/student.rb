class Student < ActiveRecord::Base
  has_many :student_tasks
end
