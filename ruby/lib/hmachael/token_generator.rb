class TokenGenerator
  class InvalidSignatureTimestampException < StandardError; end
  class MissingMandatoryFieldsException < StandardError; end

  attr_accessor  :hmac_token

end