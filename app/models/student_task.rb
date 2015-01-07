class StudentTask < ActiveRecord::Base
  belongs_to :student
  belongs_to :task

  enum state: [:free, :wip, :done, :rejected, :accepted]
end
