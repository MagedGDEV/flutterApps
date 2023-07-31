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

**[http](https://pub.dev/packages/http/install)** is a dart package developed by flutter team that allows you to make HTTP requests to a server. we can use it to get data from the internet.

To request data from the internet, we use **`get()`** method.

```dart
Future<void> getData() async {
  Response response = await get(
    Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=22946be908043815a1407391d949a5e0',
    ),
  );
  print(response.body);
}
```

**`reposne.body`** is the data that we get from the internet, if you want to check if the request was successful or not, you can check the **`response.statusCode`** more information about the status code can be found [here](https://www.restapitutorial.com/httpstatuscodes.html).

**Output:**

```bash
flutter: {"coord":{"lon":139,"lat":35},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"base":"stations","main":{"temp":298.32,"feels_like":299.06,"temp_min":298.32,"temp_max":298.32,"pressure":1014,"humidity":83},"visibility":10000,"wind":{"speed":0.45,"deg":181,"gust":1.34},"clouds":{"all":21},"dt":1690723400,"sys":{"type":2,"id":2019346,"country":"JP","sunrise":1690660271,"sunset":1690710572},"timezone":32400,"id":1851632,"name":"Shuzenji","cod":200}
```

Most famous response formats are **JSON** and **XML**.

**JSON** stands for JavaScript Object Notation, it is a lightweight format for storing and transporting data. JSON is often used when data is sent from a server to a web page.

**XML** stands for eXtensible Markup Language, it is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.

**JSON** is more popular than **XML**.

What we are using in this project is **JSON**, and to be able to decode json data into dart objects we need to use dart package called **`dart:convert`** that provides encoding and decoding of JSON.

**`jsonDecode()`** is used to decode json data into dart objects.

```dart
import 'dart:convert';
  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=22946be908043815a1407391d949a5e0'));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      double temperature = decodedData['main']['temp'];
      print(temperature);

    } else {
      print(response.statusCode);
    }
  }
```

