# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :new_cookie_store, key: '_subdomain_sessioning', domain: :all, :tld_length => 2
