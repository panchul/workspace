
## UNDER CONSTRUCTION

# SSH protocol

http://en.wikipedia.org/wiki/Secure_Shell
http://www.ssh.com/


---

1. When you enter ```ssh user@example.com```, your client and the host exchange keys.
2. If you are connecting for the first time, SSH will prompt you for your approval of
 the host key.
3. If you have a private key in your ```~/.ssh``` folder that matches one of the keys
 in ```~/.ssh/authorized_keys```, the connection continues to step 4. Otherwise if
 password authentification is allowed, SSH will prompt you for your password.
4. The transferred key is used to create a session key that is used for the remainder
 of the connection, encrypting all the communication with a cipher such as AES, 3DES, Blowfish or RC4("arcfour")

So, here's what you need to do to not have to enter passwords all the time to login from
machine A to machine B:

1. run ```ssh-keygen``` on machine A. Do not enter the password for the key, save it in
 a file ```id_rsa_keya```
2. append ```id_rsa_keya.pub``` to ```~/.ssh/authorized_keys``` on host B.

That is it. Connect from host A to host B using, for example:

    $ ssh -i ~/.ssh/id_rsa_keya user@hostB

---
