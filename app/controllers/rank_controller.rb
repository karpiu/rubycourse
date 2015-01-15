class RankController < ApplicationController
  before_filter :authenticate_user!, only: [:refresh]

  def rank
    @students = Student.order('id ASC')
    @milestones = Milestone.order('number ASC')
    @tasks = Task.order('number ASC')
  end

  def refresh
    @students = Student.all
    @tasks = Task.all
    @students.each do |student|
      @tasks.each do |task|
        student_task = student.student_tasks.find { |st| st.task == task }
        if student_task.nil?
          student_task = StudentTask.new
          student_task.student = student
          student_task.task = task
        end
        student_task.state = GithubHelper.check_issue_state(student, task, REPO_NAME, ADMIN_GITHUB_LOGIN)
        student_task.save!
      end
    end

    redirect_to root_path
  end
end
