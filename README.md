# i_am_rich

This is a simple app that displays an image.

| iOS | Android |
|--|--|
|![iOS_Rich](screenshots/iphone14ProMax_4.png)|![Android_Rich](screenshots/nexus6_4.png)|

The i_am_poor app is the same as the i_am_rich app, but it displays a different image, added as challenge to ensure that we understand the concepts.

## i_am_poor (Challenge)

| iOS | Android |
|--|--|
|![iOS_Poor](screenshots/iphone14ProMax_5.png)|![Android_Poor](screenshots/nexus6_5.png)|

Flutter apps is formed of widgets.
Each widget can be a container of other widgets.

To add text to the app, we use the widget Text.

```dart
Text('Hello World!')
```

Text widgets are placed in the top left corner of its parent widget.
In order to center the text, we use the widget Center.

> To have a well formated code in dart, we use **dartfmt**.
> you have to help it by adding a comma after each widget. 
> as shown in the example below.

```dart
Center(
  child: Text('Hello World!'),
)
```

The main function is the entry point of our application.
> ***Material app*** is the basis for all the other widgets.

```dart
void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Text('Hello World!'),
      ),
    ),
  );
}
```

| iOS | Android |
|--|--|
|![iOS_Hello World](screenshots/iphone14ProMax_1.png)|![Android_Hello World](screenshots/nexus6_1.png)|

**Scaffold** allows us to have a basic structure for our app. It is a widget that contains a lot of other widgets such as:

- AppBar
- FloatingActionButton
- BottomNavigationBar
- Drawer
- ...

```dart
MaterialApp(
  home: Scaffold(
    body: Center(
      child: Text('Hello World!'),
    ),
  ),
),
```

**App Bar** is a widget provided by the scaffold widget that allows us to have a bar at the top of the screen.
> **backgroundColor** is a property that allows us to change the background color of a widget.

```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('I Am Rich'),
      backgroundColor: Colors.blueGrey[900],
    ),
  ),
),
```

| iOS | Android |
|--|--|
|![iOS_App Bar](screenshots/iphone14ProMax_2.png)|![Android_App Bar](screenshots/nexus6_2.png)|

**body** is the primary content of the scaffold widget. It is a widget that contains other widgets.

```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('I Am Rich'),
      backgroundColor: Colors.blueGrey[900],
    ),
    body: Center(
      child: Text('Hello World!'),
    ),
    backgroundColor: Colors.blueGrey,
  ),
),
```

**Image** is a widget that allows us to display an image, and it provide us with multiple ways to access images from different sources such as:

- Network
- Asset
- File
- Memory

we use the property **image** to specify the image we want to display.

```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('I Am Rich'),
      backgroundColor: Colors.blueGrey[900],
    ),
    body: Image(
      image: NetworkImage(
              'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'),
    ),
    backgroundColor: Colors.blueGrey,
  ),
),
```

| iOS | Android |
|--|--|
|![iOS_Image](screenshots/iphone14ProMax_3.png)|![Android_Image](screenshots/nexus6_3.png)|

To wrap some wigdet within another widget, we can do this easily in android studio by selecting the widget and do on of the following:

- Press on the light bulb icon on the left of the widget
- **Option + Enter** (Mac)

Then choose the option we need from the list and prevent making mistakes.

To add assets to our apps such as images, we need to inform the app about the assets we want to use.

- To do so, we need to modify the file ***pubspec.yaml***.
- **yaml** is a markup language that is used to configure our app.

  - This language depends on indentation to define the structure of the file.
  - Each indentation is equal to **two spaces**.

```yaml
flutter:
  use-material-design: true
  assets:
    - images/diamond.png
```

In the example above, we added the image ***diamond.png*** to our app.

But we dont need to do this manually for each image we want to add, we can add the path of the folder that contains all the images we want to add.

```yaml
flutter:
  use-material-design: true
  assets:
    - images/
```

After adding the modifications to the file ***pubspec.yaml***, we need to run the command `flutter pub get` to get the assets we added.


To use the asset image, we do the following:

```dart
MaterialApp(
  home: Scaffold(
      appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
      ),
      body: Image(
          image: AssetImage('images/diamond.png'),
      ),
      backgroundColor: Colors.blueGrey,
  ),
),
```

| iOS | Android |
|--|--|
|![iOS_Asset Image](screenshots/iphone14ProMax_4.png)|![Android_Asset Image](screenshots/nexus6_4.png)|