# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/confirmation
  def confirmation
    request = Request.last

    RequestMailer.with(request: request).confirmation(request)
  end

end
