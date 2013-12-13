# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_anvitha_pro_session',
  :secret      => '9ccdfefb10a3249f872600151daad92ef9fce82a0d1e56491a91b23cc650206ccd4a5e878a2fba19e8bb1c2f995f1bc927f786cba0b39394a8a920cbf16d7f94'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
