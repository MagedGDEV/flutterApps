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
),
```

|iOS|Android|
|---|---|
|![iOS_Theme](/screenshots/iphone14ProMax_3.png)|![Android_Theme](/screenshots/nexus6_3.png)|

|final|const|
|---|---|
|final variables are initialized when they are accessed for the first time.|const variables are initialized during compilation.|
|They are used when you want to delay initialization until they are accessed for the first time.|They are used when you want to initialize a variable at compile time.|

**GestureDetector** is a widget that detects gestures. It listens for gestures and calls the appropriate callback functions when the user interacts with the widget. It can detect:

- Taps
- Double taps
- Long presses
- Vertical drags
- ...

It is useful when you already have your own widget and you want to add gesture detection to it, and you dont want to use button provided by Flutter. Because they add extra styling you may not want.

```dart
GestureDetector(
  onTap: () {
    setState(() {
      updateColor(1);
    });
  },
  child: ReusableCard(
      color: maleCardColor,
      cardChild: const IconContent(
      icon: FontAwesomeIcons.mars,
      label: 'MALE',
    ),
  ),
),
```

|iOS|Android|
|---|---|
|![iOS_GestureDetector](/screenshots/iphone14ProMax_4.gif)|![Android_GestureDetector](/screenshots/nexus6_4.gif)|

To set the content of row to be on the same line, you can use the **crossAxisAlignment** property of the **Row** widget to `CrossAxisAlignment.baseline` & **textBaseline** property  to `TextBaseline.alphabetic`.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.baseline,
  textBaseline: TextBaseline.alphabetic,
  children: [
    Text(
      '180',
      style: kNumberTextStyle,
    ),
    Text(
      'cm',
      style: kLabelTextStyle,
    ),
  ],
),
```

|Before|After|
|---|---|
|![iOS_before_baseline](/screenshots/iOS_before_baseline.png)|![iOS_after_baseline](/screenshots/iOS_after_baseline.png)|

**Slider** is a widget that allows you to select a value from a range of values, `onChanged` property is called when the user starts dragging the slider, you can set the min & max values using the `min` & `max` properties, and you can set the initial value using the `value` property.

```dart
Slider(
  value: height.toDouble(),
  min: kMinHeight,
  max: kMaxHeight,
  activeColor: kActiveColor,
  inactiveColor: kInactiveSliderColor,
  onChanged: (double newValue) {
    setState(() {
      height = newValue.round();
    });
  },
),
```

|iOS|Android|
|---|---|
|![iOS_Slider](/screenshots/iphone14ProMax_5.png)|![Android_Slider](/screenshots/nexus6_5.png)|