
[Home](Readme.md)
# Rust

rustup is an installer for
the systems programming language Rust 

See Also:

 - [C++](CPP.md)
 - [Rustup](Rustup.md)

---

Contents

- [Installing](Rust.md#installing)
- [Getting started](Rust.md#getting-started)
- [Miscellaneous](Rust.md#miscellaneous)

---

## Installing

---

See [Rusrup](Rustup.md)

---

## Getting started

---

Using cargo:

```bash
$ cargo new hello
    Creating binary (application) `hello` package
note: see more `Cargo.toml` keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

$ ls
hello
$ cd hello
$ ls -la
total 24
 4096 Jul  7 15:34 .
 4096 Jul  7 15:34 ..
 4096 Jul  7 15:34 .git
    8 Jul  7 15:34 .gitignore
   76 Jul  7 15:34 Cargo.toml
 4096 Jul  7 15:34 src

$ cd src
$ ls -la
total 12
drwxrwxr-x 2 alexp alexp 4096 Jul  7 15:34 .
drwxrwxr-x 4 alexp alexp 4096 Jul  7 15:34 ..
-rw-rw-r-- 1 alexp alexp   45 Jul  7 15:34 main.rs

$ vi main.rs 

$ cat main.rs
fn main() {
    println!("Hello, world!");
}


$ cd ..
$ cargo run
   Compiling hello v0.1.0 (~/tmp/hello)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.10s
     Running `target/debug/hello`
Hello, world!
```

---

## Miscellaneous

---
