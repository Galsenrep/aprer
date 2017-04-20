class AdminMailer < ActionMailer::Base
  #default from: "from@example.com"
  #layout 'mailer'
  def new_user_waiting_for_approval(user)
    @user = user
    mail(to: "from@example.com",
    subject: "Registration Request #{user.first_name} #{user.last_name} <#{user.email}>")
  end
end
