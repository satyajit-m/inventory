module IssuesHelper
  def pending_issues
    Issue.where(resolved: false)
  end

  def resolved_issues
    Issue.where(resolved: true)
  end
  
end
