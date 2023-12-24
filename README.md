# xylophone

This app plays different sounds when the user clicks on the different buttons. The sounds are played using the [audioplayers](https://pub.dev/packages/audioplayers) package, to act as a xylophone.

It teaches us about:

- How to incorporate open source libraries of code into our project using Flutter Packages.
- **audioplayers 4.1.0** package.

|iOS|Android|
|---|---|
|![iOS_Xylophone](screenshots/iphone14ProMax_1.png)|![Android_Xylophone](screenshots/nexus6_1.png)|

One of the powerful features of flutter is the availability of lots of developed packages that can be used to speed up the development process and make the app more beautiful and user-friendly.

These packages are available on [pub.dev](https://pub.dev/) and can be used by adding them to the `pubspec.yaml` file.

You can add a package to your project by either one of the following ways:

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

**AudioPlayer** is a package that can be used to play audio files in flutter. It is a very simple package to use and can be used to play audio files from the assets folder or from the internet.

This package expects the audio files to be in the `assets` folder of the project. So, we need to create a folder named `assets` in the root directory of the project and add the audio files to it.

```dart
import 'package:audioplayers/audioplayers.dart';

TextButton(
  onPressed: () async {
    final player = AudioPlayer();
    await player.play(AssetSource('note1.wav'));
  },
  child: const Text('Click me'),
),
```
