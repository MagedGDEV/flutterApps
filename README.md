# dicee

Adding images in the app is very easy, But we need to manage the size of the images in the app. so it can be displayed properly in all devices as in the example below.

Instead of using the `Image` widget, we can use the `Image.asset` widget to display the images in the app for better code readability.

```dart
Image.asset('images/dice1.png')
```

|iOS|Android|
|---|---|
|![iOS_image_size](screenshots/iphone14ProMax_1.png)|![Android_image_size](screenshots/nexus6_1.png)|

What happened here is called **Overflow**. The image is too big to fit in the screen. So it is overflowing. We can fix this by using the `Expanded` widget.

**Expanded** widget is used to make the child widget take up the available space in the row or column, without specifying the width or height, and prevent overflow.

```dart
Expanded(
  child: Image.asset('images/dice1.png'),
),
```

|iOS|Android|
|---|---|
|![iOS_image_size](screenshots/iphone14ProMax_2.png)|![Android_image_size](screenshots/nexus6_2.png)|

**flex** property in the `Expanded` widget is used to specify the ratio of the space that the child widget should take up compared to its siblings in a row or column, the default value is ***1***.

```dart
Row(
  children: [
    Expanded(
      flex: 5,
      child: Image.asset('images/dice1.png'),
    ),
    Expanded(
      flex: 12,
      child: Image.asset('images/dice1.png'),
    ),
  ],
);
```

|iOS|Android|
|---|---|
|![iOS_flex](screenshots/iphone14ProMax_3.png)|![Android_flex](screenshots/nexus6_3.png)|
