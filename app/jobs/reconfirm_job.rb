class ReconfirmJob < ApplicationJob
  queue_as :default

  def perform
    puts "starting fake Reconfirm job"
    sleep 30
    puts "OK I'm done now"
  end
end
