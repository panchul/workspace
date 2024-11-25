[Home](Readme.md)
# Flutter

See Also:

- [CocoaPods](CocoaPods.md)
- [Django](Django.md)
- [Gunicorn](Gunicorn.md)
- [Laravel](Laravel.md)
- [Nginx](Nginx.md)


[https://flutter.dev/](https://flutter.dev/)

---

*Contents*

- [Installing](Flutter.md#installing)
- [fvm](Flutter.md#fvm)
- [Miscellaneous](Flutter.md#miscellaneous)
- [Links](Flutter.md#links)

---

## Installing

---

https://docs.flutter.dev/get-started/install/macos/mobile-ios

On MacOs:

Check `zsh` is the default:

```bash
$ dscl . -read ~/ UserShell
UserShell: /bin/zsh
```

You can change the shell if needed:

```bash
$ chsh -s `which zsh`
```

Some Flutter components require the Rosetta 2 translation process on Macs running Apple silicon. To run all Flutter components on Apple silicon, install Rosetta 2.

```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

See [Installing CocoaPods](CocoaPods.md#installing)

```bash
sudo gem install cocoapods
```

[Ruby](Ruby.md#installing) might need upgrading, or you may downgrade drb, and a couple of other gems:

```bash
sudo gem install drb -v 2.0.6
```

Easiest way to install Flutter SDK via Visual Studio Code:

- open command palette, `Comand+Shift+P`
- type `flutter`
- select `Flutter: New Project`
- click `Locate SDK` or `Download SDK`

You may need to add `flutter/bin` to your `PATH` in, for example, `.zshrc`

---

## fvm

Flutter Version Management: A cli to manage Flutter SDK versions.

---

https://fvm.app/documentation/getting-started/installation

---

How to setup `fvm`:

https://cshanjib.medium.com/setting-up-fvm-flutter-version-management-properly-ab45ade0dd55

---


For example, building the version for android:

```bash
fvm flutter build apk
```

---

## Miscellaneous

---

Some Java prerequisites may want Java 17, the easy way to get it is with homebrew:

```bash
brew install openjdk@17 
```

https://stackoverflow.com/questions/69875335/macos-how-to-install-java-17

---

## Links

- https://flutter.dev/
