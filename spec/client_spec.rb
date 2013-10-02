require 'spec_helper'

GEM_ROOT = Gem::Specification.find_by_name('play_market').gem_dir

describe PlayMarket::Client do
  let (:receipt) { File.read(File.join(GEM_ROOT, '/spec/fixtures/receipt')) }
  signature = File.read(File.join(GEM_ROOT, '/spec/fixtures/signature'))

  it 'verifies google play purchases' do
    expect(PlayMarket::Client.new.verify!(receipt, signature)).to be_true
  end

  it 'raises verification error if the receipts is invalid' do
    expect{PlayMarket::Client.new.verify!('invalid receipt', signature)}.to raise_error(PlayMarket::VerificationError)
  end

  it 'raises verification error if the signature is invalid' do
    expect{PlayMarket::Client.new.verify!(receipt, 'invalid signature')}.to raise_error(PlayMarket::VerificationError)
  end

  it 'raises verification error if the public key is not provided' do
    expect{PlayMarket::Client.new.verify!('invalid receipt', signature)}.to raise_error(PlayMarket::VerificationError)
  end
end