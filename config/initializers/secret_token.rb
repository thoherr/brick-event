# THIS IS AN EXAMPLE FILE
# For production, this file is mounted into the docker container via docker-compose

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
BrickEvent::Application.config.secret_token = 'SOME_VERY_SECRET_TOKEN'
