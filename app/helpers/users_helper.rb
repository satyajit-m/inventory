module UsersHelper
  def check_status(status)
    p status
    if status
      'Active'
    else
      'Inactive'
    end
  end

  def check_user(user)
    if user
      "Admin"
    else
      "Employee"
    end
  end
  
end
