json.array! @notifications do |notification|
  json.sender notification.sender.name
  json.message notification.message
  json.priority notification.priority
end
