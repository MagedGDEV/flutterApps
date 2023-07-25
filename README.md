# bmi_calculator

**ThemeData** is used to configure a theme for your app. The theme data is accessible to all widgets within the app. You can use it to configure the appearance of your app, such as colors, text styles, and fonts. You can also use it to configure the size, color, background color, etc. of the app bar, bottom app bar, icon themes, button themes, etc, and have a consistent look and feel across the app.

To add a theme to your app, you need to wrap the root widget of your app in a **MaterialApp** widget and set the theme property of the MaterialApp widget to a ThemeData object.

Using the [documentation](https://api.flutter.dev/flutter/material/ThemeData-class.html) for ThemeData, you can figure out how to set the theme for each specific asspect such as:

- Color of the appbar
- Color of the background
- Size of the text
- Color of the buttons
- ...

```dart
MaterialApp(
  theme: ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF0A0E21),
  ),
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    ),
  ),
  home: InputPage(),
);
```

|iOS|Android|
|---|---|
|![iOS_ThemeData](/screenshots/iphone14ProMax_1.png)|![Android_ThemeData](/screenshots/nexus6_1.png)|

Since there are multiple themes available, you can use the **copyWith** method to copy the current theme and change only the properties you want to change.

```dart
theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF0A0E21),
  ),
),
```

|iOS|Android|
|---|---|
|![iOS_copyWith](/screenshots/iphone14ProMax_2.png)|![Android_copyWith](/screenshots/nexus6_2.png)|

You can also embed a theme within a widget. This is useful if you want to have a different theme for a specific part of your app. For example, you can have a different theme for a specific screen or a specific widget using the **Theme** widget.

```dart
floatingActionButton: Theme(
  data: ThemeData(
  floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: Colors.purple),
  ),
  child: FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
),
```

|iOS|Android|
|---|---|
|![iOS_Theme](/screenshots/iphone14ProMax_3.png)|![Android_Theme](/screenshots/nexus6_3.png)|