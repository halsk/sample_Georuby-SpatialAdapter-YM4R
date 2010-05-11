# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_areaget_session',
  :secret      => 'b5a3144e50edde556ae922b10940423fea7cfdb65b92a114f96e0d328c6fc79d1fdb004cb731dd459d599e59c557f4c563eaaa42616d4d132706e58ae3046c7a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
