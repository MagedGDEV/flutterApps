# bmi_calculator

In this app, we create a BMI calculator app that calculates the BMI of a person based on their height and weight. The app has two screens, the first screen is where the user enters their height and weight, and the second screen is where the user sees their BMI and a message based on their BMI.

|iOS|Android|
|---|---|
|![iOS](/screenshots/iphone14ProMax_0.gif)|![Android](/screenshots/nexus6_0.gif)|

## Tutorial

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

We can create customaizable widgets by modifying the ***Theme*** of the widget. For example to modify the shape of the slider, we can use the ***SliderTheme*** widget and set the ***data*** property to a ***SliderThemeData*** object, and you can find extra properties to modify in the theme data than the widget itself.

```dart
SliderTheme(
  data: const SliderThemeData(
  activeTrackColor: Colors.white,
  thumbColor: kActiveColor,
  overlayColor: kOverlayColor,
  trackHeight: 2,
  thumbShape:
    RoundSliderThumbShape(enabledThumbRadius: 15.0),
  overlayShape:
    RoundSliderOverlayShape(overlayRadius: 30.0),
  ),
  child: Slider(
    value: height.toDouble(),
    min: kMinHeight,
    max: kMaxHeight,
    inactiveColor: kInactiveSliderColor,
    onChanged: (double newValue) {
      setState(() {
        height = newValue.round();
      });
    },
  ),
),
```

|iOS|Android|
|---|---|
|![iOS_SliderTheme](/screenshots/iphone14ProMax_6.png)|![Android_SliderTheme](/screenshots/nexus6_6.png)|

One of the powerful features of Flutter is that everything is open source, and you can deep dive into the source code of any widget and see how it is implemented. and since Flutter documentation is against creating more than one floating action button, we can create our own floating action button using the source code of the original floating action button and modify it to our needs. And still follow flutter documentation for not creating more than one floating action button.

Using **RawMaterialButton**, we can create our customized button by using [documentation](https://api.flutter.dev/flutter/material/RawMaterialButton-class.html).

```dart
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;
  const RoundIconButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.0,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: kRoundIconButtonColor,
      child: Icon(icon),
    );
  }
}
```

|iOS|Android|
|---|---|
|![iOS_RoundIconButton](/screenshots/iphone14ProMax_7.png)|![Android_RoundIconButton](/screenshots/nexus6_7.png)|

To move between two pages you can use **Navigator** widget, and you can use **Navigator.push** to push a new page to the stack, and **Navigator.pop** to pop the current page from the stack.

```dart
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Result(),
      ),
    );
  },
  child: Container(
    height: kBottomContainerHeight,
    margin: const EdgeInsets.only(top: 10),
    color: kActiveColor,
    child: const Text('CALCULATE'),
  ),
),
```

|iOS|Android|
|---|---|
|![iOS_Navigator](/screenshots/iphone14ProMax_8.gif)|![Android_Navigator](/screenshots/nexus6_8.gif)|
