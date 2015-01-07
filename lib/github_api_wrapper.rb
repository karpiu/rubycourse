class GithubApiWrapper
  def self.check_issue_state(student, task, repo_name)
    issue = Octokit.issue(student.github_login + "/" + repo_name, task.number)
    if "closed".equal? issue.state
      return "accepted"
    end
    if issue.labels.find { |label| "Rejected".equal? label.name }
      return "rejected"
    end
    if issue.labels.find { |label| "Done".equal? label.name }
      return "done"
    end
    if issue.assignee.nil?
      return "free"
    else
      return "work_in_progress"
    end
  end
end