class CheckReconfirmJob < ApplicationJob
  queue_as :default

  def perform(request_id)
    request = Request.find(request_id)
    if !request.reconfirmed && request.status == 'confirmed'
      request.update(status: 'expired')
    else
      request.update(reconfirmed: false)
    end
  end
end
