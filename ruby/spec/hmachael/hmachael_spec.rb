require 'spec_helper'

RSpec.describe Hmac do

  let(:hmac_token) { '123' }
  let(:encryption_key) { 'abc' }
  let(:data) { 'data' }
  let(:hmachael_init) { Hmac.new(hmac_token: hmac_token, encryption_key: encryption_key, data: data) }

  context 'initialize' do
    subject { hmachael_init.hmac_token }
    it { is_expected.to eq hmac_token }
  end

end
