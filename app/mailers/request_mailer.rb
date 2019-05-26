class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.confirmation.subject
  #
  def confirmation(request)
    @request = request

    mail to: @request.email, subject: "Hi #{@request.first_name} please confirm"
  end

  def reconfirmation(request)
    @request = request

    mail to: @request.email, subject: "Hi #{@request.first_name} please reconfirm"
  end
end
