json.array! @notifications do |notification|
  #json.receiver notification.receiver
  json.sender notification.sender.name
  json.notifiable notification.notifiable
end