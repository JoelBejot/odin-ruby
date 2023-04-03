require 'rspec'
require 'caesar'

describe Cipher do
  describe 'caesar_cipher' do
    it "accepts a string and 0 and returns the same string" do
      caesar = Cipher.new
      expect(caesar.caesar_cipher('abcABC', 0)).to eql('abcABC')
    end
    it "accepts a string and a positive number and shifts the string appropriately" do
      caesar = Cipher.new
      expect(caesar.caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end
    it "accepts a string and a negative number and shifts the string appropriately" do
      caesar = Cipher.new
      expect(caesar.caesar_cipher('What a string!', -5)).to eql('Rcvo v nomdib!')
    end
  end
end

