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
% sudo gem install cocoapods

Successfully installed cocoapods-1.16.2
Parsing documentation for cocoapods-1.16.2
Done installing documentation for cocoapods after 0 seconds
1 gem installed
```

[Ruby](Ruby.md#installing) might need upgrading, or you may downgrade drb, and a couple of other gems:

```bash
% sudo gem install drb
Password:
Fetching drb-2.2.1.gem
Successfully installed drb-2.2.1
Parsing documentation for drb-2.2.1
Installing ri documentation for drb-2.2.1
Done installing documentation for drb after 1 seconds
1 gem installed
```

Or a specific version:

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

## Debugging

---

For debugging, you can pick the target device (using Shift-Option-P and 'flutter'),
and use `--debug` option:

```bash
$ flutter run --debug

Connected devices:
macOS (desktop)                 • macos                 • darwin-arm64   • macOS 15.1.1 24B2091 darwin-arm64
Mac Designed for iPad (desktop) • mac-designed-for-ipad • darwin         • macOS 15.1.1 24B2091 darwin-arm64
Chrome (web)                    • chrome                • web-javascript • Google Chrome 131.0.6778.86

No wireless devices were found.

[1]: macOS (macos)
[2]: Mac Designed for iPad (mac-designed-for-ipad)
[3]: Chrome (chrome)
[4]: Pixel 9 Pro API 37 (Android)
Please choose one (or "q" to quit): 3
Launching lib/main.dart on Chrome in debug mode...
Waiting for connection from debug service on Chrome...              5.0s
This app is linked to the debug service: ws://127.0.0.1:51041/O_i5608vg8s=/ws
Debug service listening on ws://127.0.0.1:51041/O_i5608vg8s=/ws

🔥  To hot restart changes while running, press "r" or "R".
For a more detailed help message, press "h". To quit, press "q".

A Dart VM Service on Chrome is available at: http://127.0.0.1:51041/O_i5608vg8s=
The Flutter DevTools debugger and profiler on Chrome is available at: http://127.0.0.1:9101?uri=http://127.0.0.1:51041/O_i5608vg8s=
```

The break points and other information is available in Visual Studio, or a web debugger pops up.

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
