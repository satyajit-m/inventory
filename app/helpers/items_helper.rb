module ItemsHelper
  def file_name(path)
    p path
    path.present? ? File.basename(path) : ""
  end

  def list_users
    User.where(admin: false, status: true)
  end

  def item_status(status)
    if status
      "Working"
    else
      "Not Working"
    end
  end

  def format_user(value)
    value ? value.name : "N.A."
  end
end
