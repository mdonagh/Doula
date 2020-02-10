require 'gibbon'

Gibbon::Request.api_key = Rails.application.credentials[:mailchimp][:api_key]
