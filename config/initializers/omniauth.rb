OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '44151351856-17saal5ku5lihd6m62ajacsa91lg706s.apps.googleusercontent.com', 'uadTbDyw0C3lgf-gLOAJuFxF',
  {
      :scope => "youtube, userinfo.email",
      client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}
  }
end


#  Rails.application.config.middleware.use OmniAuth::Builder do
#
#   provider :google_oauth2, '44151351856-17saal5ku5lihd6m62ajacsa91lg706s.apps.googleusercontent.com', 'uadTbDyw0C3lgf-gLOAJuFxF',
#   {
#       :name => "google",
#       :scope => "youtube, userinfo.email",
#       :prompt => "select_account",
#       :image_aspect_ratio => "square",
#       :image_size => 50
#   }
#
# end
