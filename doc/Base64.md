# Base64.md

---

Cloned a ok implementeation of the encoder and decoder:
https://github.com/panchul/cpp-base64

Here's the idiomatic snippet of usage(add `base64.cpp` to the project):

    std::string text_original = "abc";
    std::string encoded_reference = "YWJj";
    
    std::string text_encoded = base64_encode(reinterpret_cast<const unsigned char*>(text_original.c_str()),
                                text_original.length());
    std::string text_decoded = base64_decode(text_encoded);
    
    std::cout << "encoded:   " << text_encoded << std::endl;
    std::cout << "reference: " << encoded_reference << std::endl;
    std::cout << "decoded:   " << text_decoded << std::endl << std::endl;

---

Encoding and decoding using the utility:

    $ echo something | base64
    c29tZXRoaW5nCg==
    
    $ echo c29tZXRoaW5nCg==  | base64 -d
    something

---