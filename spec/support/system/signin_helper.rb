module System
  module SigninHelper
    def signin_as_user(invalid = false)
      invalid ? mock_invalid_auth_hash : mock_valid_auth_hash
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:auth0]
      visit '/auth/auth0/callback?code=vihipkGaumc5IVgs'
    end

    private

    def mock_valid_auth_hash
      opts = { "provider": 'auth0', "uid": '12345' }
      OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new(opts)
    end

    def mock_invalid_auth_hash
      OmniAuth.config.mock_auth[:auth0] = :invalid_credentials
    end
  end
end
