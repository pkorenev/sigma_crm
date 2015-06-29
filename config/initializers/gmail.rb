# -*- encoding : utf-8 -*-
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => (ENV["SMTP_SETTINGS_DOMAIN"] if ENV["SMTP_SETTINGS_DOMAIN"] != 'false' ),
    :user_name            => ENV["SMTP_SETTINGS_USER_NAME"],
    :password             => ENV["SMTP_SETTINGS_PASSWORD"],
    :authentication       => "plain",
    :enable_starttls_auto => true
}