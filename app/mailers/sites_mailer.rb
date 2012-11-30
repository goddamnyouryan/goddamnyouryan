class SitesMailer < ActionMailer::Base
  default from: "ryan@your-site-asshole.com"

  def contact_form(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(to: 'ryan.macinnes@gmail.com', subject: 'Some asshole is contacting you via your site')
  end
end
