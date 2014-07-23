require 'digest/sha1'
class User < ActiveRecord::Base

  before_save :ensure_authentication_token, :encrypt

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def encrypt
    self.password = Digest::SHA1.hexdigest(self.password)
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest(password)
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
