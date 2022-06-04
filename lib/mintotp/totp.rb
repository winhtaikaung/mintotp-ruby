require 'base32'
require 'openssl'

module Mintotp
  class TOTP
    #
    # @example 
    #    SECRET1 = "ZYTYYE5FOAGW5ML7LRWUL4WTZLNJAMZS"
    #    minTotp = Mintotp::TOTP.new()
    #    minTotp.totp(SECRET1)
    # @param [string] secret key
    # @param [integer] TimeStep Second Default is 30 Second in Google Authenticator
    # @param [integer] Number of digits that will generate
    # @param ['sha1'] : hash name
    #
    # @return [string] if so
    def totp(key, time_step=30, digits=6, digest='sha1')
      hotp(key, Time.now.to_i / time_step, digits, digest)
    end

    def hotp(key, counter, digits=6, digest='sha1')
      key = Base32.decode "#{key}#{"="* ((8-key.length)%8)}"
      sha = OpenSSL::Digest::Digest.new(digest)
      counter = [counter].pack('Q>')
      hmac= OpenSSL::HMAC.digest(sha, key, counter)
      
      offset = hmac.bytes.last & 0x0f   
      bytes = hmac.bytes[offset..offset+4]

      # unpack by bytes shifting
      bytes[0] = bytes[0] & 0x7f
      bytes_as_integer = (bytes[0] << 24) + (bytes[1] << 16) + (bytes[2] << 8) + bytes[3]
      bytes_as_integer.modulo(10 ** digits).to_s.rjust(digits,'0')
    end
  end
end
