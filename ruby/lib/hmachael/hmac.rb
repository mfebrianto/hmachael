class Hmac

  attr_accessor :hmac_token, :encryption_key, :data

  def initialize(hmac_token: nil, encryption_key: nil, data: nil)
    @hmac_token = hmac_token
    @encryption_key = encryption_key
    @data = data
  end


end