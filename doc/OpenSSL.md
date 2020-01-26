# OpenSSL

https://www.openssl.org/

---

Neat walk-through how to Secure Apache with SSL certificate on CentOS8
https://www.tecmint.com/secure-apache-with-lets-encrypt-ssl-certificate-on-centos-8/

---

Nice discussion about private and public keys.

https://stackoverflow.com/questions/5244129/use-rsa-private-key-to-generate-public-key/5246045


This will actually produce a private key mykey.pem with enough information to calculate
the public key.

    $ openssl genrsa -out mykey.pem 1024

These commands calculate the public key:

    $ openssl rsa -in mykey.pem -pubout > mykey.pub
    $ openssl rsa -in key.pem -pubout -out pubkey.pem

or

    $ ssh-keygen -y -f mykey.pem > mykey.pub

---

From this gist: https://gist.github.com/cowboyrushforth/5963752

    # RUBY 
    
    require 'openssl'
    require 'digest/sha2'
    require 'json'
    
    def bin2hex(str)
      str.unpack('C*').map{ |b| "%02X" % b }.join('')
    end
    
    def hex2bin(str)
      [str].pack "H*"
    end
    
    # the encryption in ruby
    # you can provide salt and iv, or not
    # if not it will be generated for you
    def encrypt(salt=nil, iv=nil, payload, pwd)
      cipher = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
      cipher.encrypt
      if salt.nil?
        salt = OpenSSL::Random.random_bytes(8)
      else
        salt = hex2bin(salt)
      end
      if iv.nil?
        iv = cipher.random_iv
      else
        iv = hex2bin(iv)
      end
      key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(pwd, salt, 1024, cipher.key_len)
      cipher.key = key
      # AVP: This line is probably a typo or a debug leftovers.
      #iv = cipher.random_iv
      cipher.iv = iv
      cipher.padding = 1 
      encrypted_binary = cipher.update(payload) + cipher.final
    
      return bin2hex(salt), bin2hex(iv), bin2hex(encrypted_binary) 
    end
    
    # the decryption
    # you must provide the salt, iv, and encrypted paylaod
    # you need the password too, but that can be in config
    def decrypt(salt, iv, encrypted_payload, pwd)
    
      cipher = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
      cipher.decrypt
      key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(pwd, hex2bin(salt), 1024, cipher.key_len)
      cipher.key = key
      cipher.iv = hex2bin(iv)
      cipher.padding = 1 
      plaintext = cipher.update(hex2bin(encrypted_payload))
      plaintext << cipher.final
    
      return plaintext
    end
    
    
    
    # JAVA
    
    import javax.crypto.Cipher;
    import javax.crypto.Mac;
    import javax.crypto.spec.IvParameterSpec;
    import javax.crypto.spec.SecretKeySpec;
    import java.security.AlgorithmParameters;
    import java.security.spec.KeySpec;
    import javax.crypto.Cipher;
    import javax.crypto.SecretKey;
    import javax.crypto.SecretKeyFactory;
    import javax.crypto.spec.IvParameterSpec;
    import javax.crypto.spec.PBEKeySpec;
    import javax.crypto.spec.SecretKeySpec;
    
    class EncryptorDecryptor {
    
      public static String bin2hex(byte[] data)
      {
        if (data==null)
        {
          return null;
        }
    
        int len = data.length;
        String str = "";
        for (int i=0; i<len; i++) {
          if ((data[i]&0xFF)<16)
            str = str + "0" + java.lang.Integer.toHexString(data[i]&0xFF);
          else
            str = str + java.lang.Integer.toHexString(data[i]&0xFF);
        }
        return str;
      }
    
      public static byte[] hex2bin(String str) {
        if (str==null) {
          return null;
        } else if (str.length() < 2) {
          return null;
        } else {
          int len = str.length() / 2;
          byte[] buffer = new byte[len];
          for (int i=0; i<len; i++) {
            buffer[i] = (byte) Integer.parseInt(str.substring(i*2,i*2+2),16);
          }
          return buffer;
        }
      }
    
      public static String encrypt(String salt, String iv, String plaintext, String pwd) throws Exception {
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        KeySpec spec = new PBEKeySpec(pwd.toCharArray(), hex2bin(salt), 1024, 256);
        SecretKey tmp = factory.generateSecret(spec);
        SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");
    
        byte[] iv_bytes = hex2bin(iv);
        String value = new String(iv_bytes);
        IvParameterSpec ivspec = new IvParameterSpec(iv_bytes);
    
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secret, ivspec);
    
        byte[] encrypted = cipher.doFinal(plaintext.getBytes());
    
        return new String(bin2hex(encrypted));
      }
    
      public static String decrypt(String salt, String iv, String payload, String pwd) throws Exception {
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        KeySpec spec = new PBEKeySpec(pwd.toCharArray(), hex2bin(salt), 1024, 256);
        SecretKey tmp = factory.generateSecret(spec);
        SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");
    
        byte[] iv_bytes = hex2bin(iv);
        String value = new String(iv_bytes);
        IvParameterSpec ivspec = new IvParameterSpec(iv_bytes);
    
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secret, ivspec);
    
        byte[] payload_bytes = hex2bin(payload);
        byte[] decrypted = cipher.doFinal(payload_bytes);
    
        return new String(decrypted);
      }
    }

---

Generate a 2048 bit RSA Key
You can generate a public and private RSA key pair like this:

    $ openssl genrsa -des3 -out private.pem 2048

This exports public key:

    $ openssl rsa -in private.pem -outform PEM -pubout -out public.pem

This exports private key:

    $ openssl rsa -in private.pem -out private_unencrypted.pem -outform PEM

---
