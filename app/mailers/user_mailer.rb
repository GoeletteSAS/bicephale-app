class UserMailer < ApplicationMailer
  default from: 'no-reply@jardinfrancais.online'

  def welcome_email(user)
    @user = user
    @url  = 'https://jardinfrancais.online/login'
    mail(to: user.email, subject: 'Bienvenue chez Bicephale')
  end
end
