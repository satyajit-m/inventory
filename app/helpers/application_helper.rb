module ApplicationHelper
  def admin_user
    User.where(admin: true)
  end

  def notification_count
    Notification.where(receiver_id: User.current.id, read_at: nil).count
  end

  def show_icon_link(path)
    link_to fa_icon("eye"), path, class: "btn btn-primary"
  end

  def edit_icon_link(path)
    link_to fa_icon("edit"), path, class: "btn btn-secondary"
  end

  def delete_icon_link(path)
    link_to fa_icon("trash"), path, method: :delete, class: "btn btn-danger", data: { confirm: t('application.delete') }
  end

  def new_text_link(path)
    link_to "New", path, class: "btn btn-primary"
  end

  def show_text_link(path)
    link_to "Show", path, class: "btn btn-primary m-2"
  end

  def edit_text_link(path)
    link_to "Edit", path, class: "btn btn-primary m-2"
  end

  def back_text_link(path)
    link_to 'Back', request.referrer, class: "btn btn-secondary m-2"
  end
end
