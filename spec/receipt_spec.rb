require 'spec_helper'

GEM_ROOT = Gem::Specification.find_by_name('play_market').gem_dir

describe PlayMarket::Receipt do
  let (:receipt) { File.read(File.join(GEM_ROOT, '/spec/fixtures/receipt')) }
  let (:signature) { File.read(File.join(GEM_ROOT, '/spec/fixtures/signature')) }

  it 'returns verified google play receipt' do
    verified_receipt = PlayMarket::Receipt.verify(receipt, signature)
    p verified_receipt.inspect
    expect(verified_receipt).to be_a PlayMarket::Receipt
  end

  it 'returns false for an invalid receipt' do
    expect(PlayMarket::Receipt.verify('invalid receipt', signature)).to be_false
  end
end