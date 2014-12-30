class StudentTask < ActiveRecord::Base
  belongs_to :student
  belongs_to :task

  enum state: [:free, :work_in_progress, :done, :rejected, :accepted]
end
