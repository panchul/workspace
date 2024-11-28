[Home](Readme.md)
# Ruby


*Contents*

- [Installing](Ruby.md#installing)
- [Miscellaneous](Ruby.md#miscellaneous)
- [Links](Ruby.md#links)

---

## Installing

---


Upgrading on Mac:

https://mac.install.guide/ruby/update

!!! This means it is MacOS's Ruby, let it be:

```bash
% which -a ruby           
/usr/bin/ruby
```

See [Do NOT Use the MacOS System Ruby](https://mac.install.guide/faq/do-not-use-mac-system-ruby/)

You may need to put the keg-only ruby ahead of the default (which is MacOS's ruby)

```bash
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include $CPPFLAGS"
```

---

## Miscellaneous

---

https://www.ruby-lang.org/en/downloads/
https://rubyinstaller.org/downloads/ - for windows

---

Ruby's public/private/protected overview
https://dev.to/sunnyb/public-vs-private-vs-protected-9hk

---

http://bundler.io/ - bundler, package manager for Ruby

---

Cute Ruby book:

    http://www.rubyinside.com/media/poignant-guide.pdf

The tutorial with interactive steps:

    http://tryruby.org/levels/2/challenges/5

---

## Links

---
