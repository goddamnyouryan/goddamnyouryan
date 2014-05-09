class SitesMailer < ActionMailer::Base
  def contact_form(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(to: 'ryan.macinnes@gmail.com', subject: 'Some asshole is contacting you via your site', from: @email)
  end
end
