class SitesMailer < ActionMailer::Base
  def contact_form(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(to: 'ryan.macinnes@gmail.com', subject: 'Website contact form, yo.', from: @email)
  end
end
