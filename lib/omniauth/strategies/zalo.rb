require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Zalo < OmniAuth::Strategies::OAuth2
      include BuildAccessToken

      option :name, 'zalo'

      option :client_options, {
        site: 'https://oauth.zaloapp.com',
        authorize_url: '/v4/permission',
        token_url: '/v4/access_token'
      }

      option :pkce, true

      # option :provider_ignores_state, true

      uid { raw_info['id'] }

      info do
        {
          name:  raw_info['name'],
          image: raw_info['picture']['data']['url'],
        }
      end

      # def authorize_params
        # super.merge(app_id: self.options.client_id, code_challenge: options.client_options.code_challenge)
      # end

      #def build_access_token
      #  oauth2_access_token
      #end

      #def raw_info
      #  get_user_info
      #end

     # alias :old_callback_url :callback_url

      # def callback_url
      #  if request.params['callback_url']
      #    request.params['callback_url']
      #  else
      #    old_callback_url
      #  end
      # end
    end
  end
end
