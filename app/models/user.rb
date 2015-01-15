class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    provider = auth["provider"]
    uid = auth["uid"]
    login = auth["info"]["nickname"]
    if "github" != provider || ADMIN_GITHUB_LOGIN != login
      raise NonAdminLoginError, 'Non admin login attempt'
    end
    create! do |user|
      user.provider = provider
      user.uid = uid
      user.login = login
    end
  end
end
