module ItemsHelper
  def file_name(path)
    p path
    path.present? ? File.basename(path) : ""
  end
  def list_users
    User.where(admin: false, status: true)
  end

end
