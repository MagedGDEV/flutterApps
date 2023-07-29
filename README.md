# clima

**[geolocator](https://pub.dev/packages/geolocator/install)** is a dart package that allows you to get the location of your device, to be able to use it in our applications. we need to add permissions to both Android and iOS.

- Android
  - Add the following permissions to your Android Manifest file located in **`projectname`**/android/app/src/main/AndroidManifest.xml.
  - **`ACCESS_COARSE_LOCATION`** Allows the API to use WiFi or mobile cell data (or both) to determine the device's location. The API returns the location with an accuracy approximately equivalent to a city block.
  - **`ACCESS_FINE_LOCATION`** Allows the API to determine as precise a location as possible from the available location providers, including the Global Positioning System (GPS) as well as WiFi and mobile cell data.

```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

- iOS
  - Add the following keys to your Info.plist file, located in **`projectname`**/ios/Runner/Info.plist.

```xml
<key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
```

And at the dart file we need to check the permission status first before we can get the location of the device.

```dart
Future<void> askPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }
```

Then we can get the location of the device.

```dart
Future<void> getLocation() async {
    await askPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
```

|iOS|Android|
|---|---|
|![iOS_location](/screenshots/iphone14ProMax_1.gif)|![Android_location](/screenshots/nexus6_1.gif)|

**Widget lifecycle** is the state of the widget at a particular time. The widget lifecycle is divided into two parts:

- **StatelessWidget** lifecycle

  - **`build()`** is called when the widget is inserted into the widget tree.

- **StatefulWidget** lifecycle

  - **`initState()`** is called when the widget is inserted into the widget tree.
  - **`build()`** is called when the widget is inserted into the widget tree.
  - **`deactivate()`** is called when the widget is removed from the widget tree temporarily.
  - ...

```dart
void initState() {
  super.initState();
  getLocation();
}
```