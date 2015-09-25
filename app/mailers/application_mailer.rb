class ApplicationMailer < ActionMailer::Base

  default from: Site.first.email
  layout 'mailer'
  
end
