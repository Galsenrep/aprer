class Contact < MailForm::Base
  attribute :objet
  attribute :nom_prenom,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "your_email@example.org",
      :from => %("#{objet}+" "+#{nom_prenom}" <#{email}>)
    }
  end
end
