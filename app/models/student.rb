class Student < ActiveRecord::Base
  has_many :student_tasks

  def points
    student_tasks.select { |st| "accepted" == st.state }.size
  end
end
