[Home](Readme.md)
# Buck

See Also:

 - [DVC](DVC.md)
 - [Git](Git.md)
 - [Mercurial](Mercurial.md)
 - [Subversion](Subversion.md)
 - [npm](Npm.md)

https://buck2.build/

https://github.com/facebook/buck2

---

Contents

- [Installing](Buck.md#installing)
- [Miscellaneous](Buck.md#miscellaneous)

---

## Installing

---

from https://buck2.build/docs/getting_started/

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install nightly-2023-10-01
cargo +nightly-2023-10-01 install --git https://github.com/facebook/buck2.git buck2
```

The above commands install buck2 into a suitable directory, such as `$HOME/.cargo/bin`, which you should then add to your `$PATH`:

```bash
export PATH=$HOME/.cargo/bin:$PATH
```

---

## Miscellaneous

---

- https://rustup.rs/

---