class ApplicationMailer < ActionMailer::Base.smtp_settings = {
  :address        => ENV['smtp.mailgun.org'],
  :user_name      => ENV['postmaster@app839c9f84ade24577a85d70365434e3c9.mailgun.org'],
  :password       => ENV['09b9c52ee6b9ef3aeaf7e0e2d0307ef7'],
  :domain         => 'https://enigmatic-bayou-52069.herokuapp.com/',
  :authentication => :plain,
}
  default from: 'from@example.com'
  layout 'mailer
ActionMailer::Base.delivery_method = :smtp
end
