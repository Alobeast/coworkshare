class RequestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.confirmation.subject
  #
  def confirmation(request)
    @request = request

    mail to: @request.email, subject: "Please confirm your workstation request"
  end

  def reconfirmation(request)
    @request = request
    @waiting_list = Request.order('created_at').confirmed.to_a
    if request.status == "confirmed"
      @position = @waiting_list.index { |confirmed| confirmed.id == @request.id } + 1
      mail to: @request.email, subject: "Please reconfirm your workstation request"
    end
  end
end
