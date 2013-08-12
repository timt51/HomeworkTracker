Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "550291301694302", "596eb2e8f4d51cd76b6cfdc4bd84e7e5"
  provider :twitter, "vWNHlVbw2Q6WNf1flwHFFg", "Bws5pRCRFeQnj6ebLwLzZt0kP4Ja86204ck65Efw"
end