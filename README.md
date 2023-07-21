# Xylophone

One of the powerful features of flutter is the availability of lots of developed packages that can be used to speed up the development process and make the app more beautiful and user-friendly.

These packages are available on [pub.dev](https://pub.dev/) and can be used by adding them to the `pubspec.yaml` file.

You can a package to your project by either one of the following ways:

- Adding the package name under the **dependencies** section of the `pubspec.yaml` file and running `flutter pub get` in the terminal.

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  audioplayers: ^4.1.0
```

- Run `flutter pub add <package_name>` in the terminal.

```bash
flutter pub add audioplayers
```
