class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(new_notify)
    #ActionCable.server.broadcast 'notification_channel',  counter: render_counter(counter)
    ActionCable.server.broadcast "notification_channel", content: new_notify
  end
  # rails jobs:work

  private

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'notifications/counter', locals: { counter: counter })
  end
end
