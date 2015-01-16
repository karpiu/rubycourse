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
    @student_tasks = StudentTask.all
    threads = []
    @students.each do |student|
      @tasks.each do |task|
        student_task = @student_tasks.find { |st| st.task == task && st.student == student }
        if student_task.nil?
          student_task = StudentTask.new
          student_task.student = student
          student_task.task = task
          @student_tasks << student_task
        end
        threads << Thread.new {
          student_task.state = GithubHelper.check_issue_state(student, task, REPO_NAME, ADMIN_GITHUB_LOGIN)
        }
      end
    end

    threads.each &:join
    @student_tasks.each &:save!
    redirect_to root_path
  end
end
