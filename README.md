# mi_card

This is a simple business card app, that shows my name, my job title, my email, and my phone number, and it teaches us about the following:

- **Hot Reload** & **Hot Restart**
- **Container**
- **SafeArea**
- **Margin** & **Padding**
- **Column** & **Row**
  - **mainAxisAlignment**
  - **crossAxisAlignment**
- **CircleAvatar**
- **TextStyle**
  - Adding downloaded font family to our app
- **Icon**
- **SizedBox**
- **Card**
- **ListTile**
- **Divider**

|iOS|Android|
|:---:|:---:|
|![iOS](/screenshots/iphone14ProMax_10.png)|![Android](/screenshots/nexus6_10.png)|

## Tutorial

**Hot Reload** is an important tool for Flutter developers. It allows you to make changes to your code and see the results instantly, without restarting your application or losing its state.

In order to be able to use **Hot Reload**, we need to make sure that we are using a **StatelessWidget** or a **StatefulWidget** as in the below example:

```dart
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Container(),
      ),
    );
  }
}
```

**build()** method is called every time we make a change to our code. It is the method that builds the widget tree. It is called every time we make a change to our code.

**Hot Restart** is a another tool that allows us to restart the app from scratch. It is useful when we make changes to the **main()** method or when we add new dependencies to our **pubspec.yaml** file, and still doesn't take much time to restart the app as building the app from scratch.

**Container** is a widget that acts as a `<div>` in HTML. It allows us to add padding, margin, border, background color, etc. to our widgets.

>[!NOTE]
> Container is a widget that can only have one child widget, and when we don't specify a child widget, it tries to be as big as possible.

if you added a widget as a child to contianer, it will be placed at the top left corner of the screen. and this may interfere with notches of some devices like the ones in iPhone mobiles.

**SafeArea** is a widget that makes sure that the content of our app is visible on the screen. It is useful when we want to make sure that the contents of our app is not hidden behind the notch of the device.

>[!NOTE]
> To change the background color of the Container, we can use the **color** property of the Container widget.

```dart
SafeArea(
  child: Container(
    color: Colors.white,
    child: Text(
      'Hello World!',
      style: TextStyle(fontSize: 25),
    ),
  ),
),
```

|Before SafeArea|After SafeArea|
|:---:|:---:|
|![Before SafeArea](/screenshots/before_safe_area.png)|![After SafeArea](/screenshots/after_safe_area.png)|

**Container** widget provides us with important properties that helps us in styling our apps such as:

- **margin**
  - It is the space outside the container.
- **padding**
  - It is the space inside the container, it moves the child widget inside the container.
- width
  - It is the width of the container.
- height
  - It is the height of the container.

Both **margin** and **padding** take a **EdgeInsets** object as a value. **EdgeInsets** is a class that allows us to specify the amount of space we want to add to our widgets, and it has four different types of constructors:

- **EdgeInsets.all()**
  - It adds the same amount of space to all sides of the widget.
- **EdgeInsets.symmetric()**
  - It adds different amounts of space to the vertical and horizontal sides of the widget.
- **EdgeInsets.fromLTRB()**
  - It adds different amounts of space to the left, top, right, and bottom sides of the widget.
- **EdgeInsets.only()**
  - It adds different amounts of space to the left, top, right, and bottom sides of the widget, and you don't have to specify all the sides.

```dart
Container(
  color: Colors.white,
  width: 120,
  height: 100,
  margin: EdgeInsets.only(left: 100),
  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 15),
  ),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_Container](/screenshots/iphone14ProMax_1.png)|![Android_Container](/screenshots/nexus6_1.png)|

**Column** is a widget that allows us to place widgets vertically, one after the other.

```dart
Column(
  children: [
    Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: Text('Container 1'),
    ),
    Container(
      color: Colors.red,
      width: 100,
      height: 100,
      child: Text('Container 2'),
    ),
    Container(
      color: Colors.blue,
      width: 100,
      height: 100,
      child: Text('Container 3'),
    ),
  ],
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_Column](/screenshots/iphone14ProMax_2.png)|![Android_Column](/screenshots/nexus6_2.png)|

Column widget takes a **mainAxisAlignment** property that allows us to align the widgets inside the column vertically. It takes a **MainAxisAlignment** object as a value, and it has different types of values.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: Text('Container 1'),
    ),
    Container(
      color: Colors.red,
      width: 100,
      height: 100,
      child: Text('Container 2'),
    ),
    Container(
      color: Colors.blue,
      width: 100,
      height: 100,
      child: Text('Container 3'),
    ),
  ],
),
```

|Code|Explanation|Result|
|:---:|:---:|:---:|
|`mainAxisAlignment: MainAxisAlignment.start`| Place the children as close to the start of the main axis as possible |![MainAxisAlignment.start](/screenshots/iphone14ProMax_2.png)|
|`mainAxisAlignment: MainAxisAlignment.end`| Place the children as close to the end of the main axis as possible |![MainAxisAlignment.end](/screenshots/main_end.png)|
|`mainAxisAlignment: MainAxisAlignment.center`| Place the children as close to the middle of the main axis as possible |![MainAxisAlignment.center](/screenshots/main_center.png)|
|`mainAxisAlignment: MainAxisAlignment.spaceEvenly`| Place the free space evenly between the children as well as before and after the first and last child |![MainAxisAlignment.spaceEvenly](/screenshots/main_space_evenly.png)|
|`mainAxisAlignment: MainAxisAlignment.spaceBetween`| Place the free space evenly between the children |![MainAxisAlignment.spaceBetween](/screenshots/main_space_between.png)|
|`mainAxisAlignment: MainAxisAlignment.spaceAround`| Place the free space evenly between the children as well as half of that space before and after the first and last child |![MainAxisAlignment.spaceAround](/screenshots/main_space_around.png)|

To set width of the container to the maximum width of the screen, we can use `double.infinity` as a value for the **width** property of the Container widget.

Column widget takes a **crossAxisAlignment** property that allows us to align the widgets inside the column horizontally. It takes a **CrossAxisAlignment** object as a value, and it has different types of values.

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: Text('Container 1'),
    ),
    Container(
      color: Colors.red,
      width: double.infinity,
      height: 100,
      child: Text('Container 2'),
    ),
    Container(
      color: Colors.blue,
      width: 100,
      height: 100,
      child: Text('Container 3'),
    ),
  ],
),
```

|Code|Explanation|Result|
|:---:|:---:|:---:|
|`crossAxisAlignment: CrossAxisAlignment.start`| Place the children as close to the start of the cross axis as possible |![CrossAxisAlignment.start](/screenshots/cross_start.png)|
|`crossAxisAlignment: CrossAxisAlignment.end`| Place the children as close to the end of the cross axis as possible |![CrossAxisAlignment.end](/screenshots/cross_end.png)|
|`crossAxisAlignment: CrossAxisAlignment.center`| Place the children as close to the middle of the cross axis as possible |![CrossAxisAlignment.center](/screenshots/cross_center.png)|
|`crossAxisAlignment: CrossAxisAlignment.stretch`| Stretch the children of the column to fill the cross axis |![CrossAxisAlignment.stretch](/screenshots/cross_stretch.png)|

**Row** is a widget that allows us to place widgets horizontally, one after the other.

**Row** also takes **mainAxisAlignment** and **crossAxisAlignment** properties that work the same way as in **Column** widget, but in the opposite direction.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: Text('Container 1'),
    ),
    Container(
      color: Colors.red,
      width: 100,
      height: 100,
      child: Text('Container 2'),
    ),
    Container(
      color: Colors.blue,
      width: 100,
      height: 100,
      child: Text('Container 3'),
    ),
  ],
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_Row](/screenshots/iphone14ProMax_3.png)|![Android_Row](/screenshots/nexus6_3.png)|

**CircleAvatar** is a widget that allows us to add circular images to our apps, it can be used to add profile pictures to our apps.

>[!NOTE]
>**radius** property of the **CircleAvatar** widget allows us to specify the radius of the circle, and **backgroundImage** property of the **CircleAvatar** widget allows us to specify the image that we want to use as a background image for the circle.

```dart
CircleAvatar(
  radius: 60,
  backgroundImage: AssetImage('images/me.PNG'),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_CircleAvatar](/screenshots/iphone14ProMax_4.png)|![Android_CircleAvatar](/screenshots/nexus6_4.png)|

To style the text, we can use **TextStyle** class. It has different properties that allows us to style the text such as:

- **color**
  - It allows us to specify the color of the text.
- **fontSize**
  - It allows us to specify the size of the text.
- **fontWeight**
  - It allows us to specify the weight of the text.
- **fontStyle**
  - It allows us to specify the style of the text.
- **fontFamily**
  - It allows us to specify the font family of the text.

```dart
Text(
  'Maged Elesseily',
  style: TextStyle(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_TextStyle](/screenshots/iphone14ProMax_5.png)|![Android_TextStyle](/screenshots/nexus6_5.png)|

To add donwloaded font family to our app, we need to add the font family to the **pubspec.yaml** file, and then we need to add the font family to the **TextStyle** class.

>[!TIP]
> You can use font families from [Google Fonts](https://fonts.google.com/) for free.

```yaml
fonts:
  - family: Pacifico
    fonts:
      - asset: fonts/Pacifico-Regular.ttf
```

```dart
Text(
  'Maged Elesseily',
  style: TextStyle(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Pacifico'),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_FontFamily](/screenshots/iphone14ProMax_6.png)|![Android_FontFamily](/screenshots/nexus6_6.png)|

**Icon** is a widget that allows us to add icons to our apps, it better that using images because it is easier to change the color of the icon, and it is easier to change the size of the icon.

You can find all the icons that are available in Flutter documentation [here](https://api.flutter.dev/flutter/material/Icons-class.html).

>[!TIP]
> **SizedBox** is a widget that allows us to add empty space between widgets.

```dart
Container(
  color: Colors.white,
  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
  padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Icon(
          Icons.email,
          color: Colors.teal,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'maged.work0@gmail.com',
          style: TextStyle(
          color: Colors.teal.shade900,
          fontSize: 20,
          fontFamily: 'Source Sans 3'),
      ),
    ],
  ),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_Icon](/screenshots/iphone14ProMax_7.png)|![Android_Icon](/screenshots/nexus6_7.png)|

**Card** is a widget that allows us to add cards to our apps, it is a widget that has a white background as a default, and it has rounded corners as a default.

Some widgets like **Card** doesn't have a **padding** property, so we need to wrap them with a **Padding** widget to be able to add padding to them.

Common used widget with **Card** widget is **ListTile** a widget that allows us to add a list item to our app, and it has a **leading** property that allows us to add an icon to the left of the list item, and it has a **title** property that allows us to add a title to the list item, and it has a default padding around it.

```dart
Card(
  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
  child: ListTile(
    leading: Icon(
      Icons.email,
      color: Colors.teal,
    ),
    title: Text(
      'maged.work0@gmail.com',
      style: TextStyle(
        color: Colors.teal.shade900,
        fontSize: 20,
        fontFamily: 'Source Sans 3'
      ),
    ),
  ),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_Card](/screenshots/iphone14ProMax_8.png)|![Android_Card](/screenshots/nexus6_8.png)|

**Divider** is a widget that allows us to add a horizontal line to our apps, it is a widget that has a grey color as a default, and it has a margin around it as a default, this is like the `<hr>` tag in HTML.

```dart
SizedBox(
  height: 20,
  width: 150,
  child: Divider(
    thickness: 0.75,
    color: Colors.teal.shade100,
  ),
),
```

|iOS|Android|
|:---:|:---:|
|![iOS_Divider](/screenshots/iphone14ProMax_9.png)|![Android_Divider](/screenshots/nexus6_9.png)|
