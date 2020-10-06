module IssuesHelper
  def pending_issues(issues)
    issues.where(resolved: false)
  end

  def resolved_issues(issues)
    issues.where(resolved: true)
  end  
end
