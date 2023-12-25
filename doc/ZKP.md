[Home](Readme.md)
# Zero-Knowledge-Proof (ZKP)

https://en.wikipedia.org/wiki/Zero-knowledge_proof

See Also:

 - [Cryptography.md](Cryptography.md)
 - [GPG.md](Gpg.md)
 - [MD5.md](MD5.md)
 - [OAuth](OAuth.md)
 - [Zero-Knowledge-Proof](ZNP.md)

---

**Contents**

- [Miscellaneous](ZKP.md#miscellaneous)

---

## Miscellaneous

---

A zero-knowledge proof must satisfy three properties:

 - Completeness: if the statement is true, the honest verifier (that is, one
   following the protocol properly) will be convinced of this fact by an honest prover.
   
 - Soundness: if the statement is false, no cheating prover can convince the honest
   verifier that it is true, except with some small probability.

 - Zero-knowledge: if the statement is true, no verifier learns anything other than the
   fact that the statement is true. In other words, just knowing the statement (not the
   secret) is sufficient to imagine a scenario showing that the prover knows the
   secret. This is formalized by showing that every verifier has some simulator
   that, given only the statement to be proved (and no access to the prover), can
   produce a transcript that "looks like" an interaction between the honest prover and
   the verifier in question.
    
---    
