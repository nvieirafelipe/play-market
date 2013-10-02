require 'openssl'
require 'base64'
require 'json'

module PlayMarket
  class VerificationError < StandardError ; end
  class Client
    GOOGLE_PLAY_PUBLIC_KEY = ENV['GOOGLE_PLAY_PUBLIC_KEY']

    attr_accessor :verification_url
    attr_reader :google_api_client

    def verify!(data, signature)
      key.verify(digest, Base64.decode64(signature), data) or raise VerificationError, "The receipt could not be authenticated."
      PlayMarket::Receipt.new(JSON.parse(data))
    end

    private
    def key
      raise VerificationError, "Need to supply Google Play public key" unless GOOGLE_PLAY_PUBLIC_KEY
      OpenSSL::PKey::RSA.new(Base64.decode64(GOOGLE_PLAY_PUBLIC_KEY))
    end

    def digest
      OpenSSL::Digest::SHA1.new
    end
  end
end
