class GithubHelper

  def self.check_issue_state(student, task, repo_name)
    issue = Octokit.issue(student.github_login + "/" + repo_name, task.number)
    if "closed" == issue.state
      return "accepted"
    end
    if issue.labels.find { |label| "rejected" == label.name.downcase }
      return "rejected"
    end
    if issue.labels.find { |label| "done" == label.name.downcase }
      return "done"
    end
    if issue.assignee.nil?
      return "free"
    else
      return "wip"
    end
  end

  def self.get_issue_url(student, task, repo_name)
    "https://github.com/#{student.github_login}/#{repo_name}/issues/#{task.number}"
  end
end