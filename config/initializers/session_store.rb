# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_egat_session',
  :secret      => 'edf64ffcffd36266277c37326fc8cd4ee41a75080728b82782c06fabda75f8014acb34c249387b4c7c3a7370349ec6f68dd3101ce9d8a897bab89092dd5a188d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
