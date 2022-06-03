RSpec.describe Mintotp do
  SECRET1 = 'ZYTYYE5FOAGW5ML7LRWUL4WTZLNJAMZS'
  SECRET2 = 'PW4YAYYZVDE5RK2AOLKUATNZIKAFQLZO'

  describe '#verify' do
    it "verify otp is correct" do
      minTotp = Mintotp::TOTP.new()
      expect(minTotp.hotp(SECRET1,0)).to eq("549419")
      expect(minTotp.hotp(SECRET2,0)).to eq("009551")
      expect(minTotp.hotp(SECRET1,0)).to eq("549419")
      expect(minTotp.hotp(SECRET2,0)).to eq("009551")
    end
  end
end
