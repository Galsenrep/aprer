class Notifier < ActionMailer::Base
  default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  def welcome(recipient)
    @account = recipient
    mail(to: user.email) do |format|
      format.text(content_transfer_encoding: "base64")
      format.html
    end
  end
end
