class RankController < ApplicationController
  def rank
    @students = Student.order('id ASC')
    @milestones = Milestone.order('number ASC')
    @tasks = Task.order('number ASC')
  end
end
