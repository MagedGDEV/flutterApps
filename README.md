# flash_chat

**Navigator named routes** are used to navigate to a named route. Using named routes is a good practice since it makes the codebase easy to read and maintain. If you need to change the name of a route, you'll only need to update it in one place.

The named routes are defined at the beginning of the main.dart file, in the **`routes`** property of the MaterialApp widget.

```dart
MaterialApp(
  theme: ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black54),
    ),
  ),
  initialRoute: WelcomeScreen.id,
  routes: {
    WelcomeScreen.id: (context) => WelcomeScreen(),
    LoginScreen.id: (context) => LoginScreen(),
    RegistrationScreen.id: (context) => RegistrationScreen(),
    ChatScreen.id: (context) => ChatScreen(),
  },
);
```

To navigate to a named route, use the **`Navigator.pushNamed()`** method. This method pushes a route to the stack of routes managed by the Navigator. The Navigator widget updates the screen to the new route.

```dart
Navigator.pushNamed(context, LoginScreen.id);
```

**Hero** widget is used to create a hero animation between two screens. Hero animations are animations between a tag in one screen to a tag in another screen. The tag can be any widget, but it's usually an image or a text.

```dart

// welcome_screen.dart
Hero(
  tag: 'logo',
  child: SizedBox(
    height: 60.0,
    child: Image.asset('images/logo.png'),
  ),
),

// login_screen.dart
Hero(
  tag: 'logo',
  child: SizedBox(
    height: 200.0,
    child: Image.asset('images/logo.png'),
  ),
),
```

|iOS|Android|
|---|---|
|![Hero Animation iOS](/screenshots/iphone14ProMax_1.gif)|![Hero Animation Android](/screenshots/nexus6_1.gif)|

To create a custom **Animation** in Flutter, we need know the the componenets of an animation which are:

- Ticker
- Animation Controller
- Animation Value

A Ticker is something that take our animation along each tick of the clock, where our animation changes in value, shape, or color.

Animation Controller controls when the animation starts, stops, or restarts. It also defines the duration of the animation.
  
Animation Value is the value of the animation at any given point in time.

We need to add **`with SingleTickerProviderStateMixin`** to the state class to use the current state of the screen as the ticker.

```dart
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  ...
}
```

**Mixin** is a way of reusing a class's code in multiple class hierarchies, because in dart we can only extend one class, but we can use multiple mixins with multiple classes.

Creating an **Animation Controller** is the beginning of creating a custom animation. The Animation Controller is created with a duration and a vsync property. The duration is the length of time the animation will take to complete. The vsync property is the ticker that will be used to tick the animation along.

In our case we are using current state of the screen as the ticker. So we are using **`this`** keyword to pass the current state of the screen as the ticker.

`controller.forward()` starts the animation.

`controller.addListener()` is used to listen to the changes in the animation value. The animation value is updated each time the animation ticks along. The animation value is accessed using `controller.value`, the default value of the animation is 0.0 and the maximum value is 1.0. The animation value is used to update the UI.

```dart

// initState function
controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 2),
);
controller.forward();
controller.addListener(() {
  setState(() {});
});
```

```dart
// build function
Scaffold(
  backgroundColor: Colors.red.withOpacity(controller.value),
  ...
);
```

|iOS|Android|
|---|---|
|![Red Animation iOS](/screenshots/iphone14ProMax_2.gif)|![Red Animation Android](/screenshots/nexus6_2.gif)|

The default type of animation is **Linear**. The animation value changes linearly from 0.0 to 1.0, flutter provides many other types of animations. One of them is **[Curved Animation](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html)**. Curved Animation is used to create a non-linear animation. The animation value changes non-linearly from 0.0 to 1.0.

if we used **CurvedAnimation** we cant add `upperBound` to be greater than 1, and when creating the animation we need to use `animation.value` instead of `controller.value`.

```dart
// initState function
controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 1),
);
animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
controller.forward();
controller.addListener(() {
  setState(() {});
  print(animation.value);
});
```

```dart
// build function
SizedBox(
  height: animation.value * 100,
  child: Image.asset('images/logo.png'),
),
```

|iOS|Android|
|---|---|
|![Decelerate Animation iOS](/screenshots/iphone14ProMax_3.gif)|![Decelerate Animation Android](/screenshots/nexus6_3.gif)|

To listen to the status of an animation, we can use the **`addStatusListener()`** method. The status of the animation can be one of the following:

- dismissed: The animation is stopped at the beginning.
- forward: The animation is going forward.
- reverse: The animation is going in reverse.
- completed: The animation has completed playing forward.

It's important to dispose the animation controller when you are changing screens. If you don't dispose the animation controller, the animation will continue to run in the background, which will cause a memory leak, specially if the animation is long, or if it's looping for ever.

```dart

// initState function
controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 1),
);
animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
controller.forward();
controller.addStatusListener((status) {
  if (status == AnimationStatus.completed) {
      controller.reverse(from: 1);
  } else if (status == AnimationStatus.dismissed) {
    controller.forward();
  }
});

controller.addListener(() {
  setState(() {});
});
```
  
```dart
// dispose function
controller.dispose();
```

|iOS|Android|
|---|---|
|![Loop Animation iOS](/screenshots/iphone14ProMax_4.gif)|![Loop Animation Android](/screenshots/nexus6_4.gif)|

Tween animation is a predefined animation that takes a value and interpolates it to another value. The value can be a color, a shape, or a number. The animation value is interpolated from the begin value to the end value. The animation value is accessed using `animation.value`, in our case we will use **`ColorTween`**.
  
```dart
// initState function
controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 1),
);
animation = ColorTween(begin: Colors.blue, end: Colors.green).animate(controller);
controller.forward();
controller.addListener(() {
  setState(() {});
});
```
  
```dart
// build function
Scaffold(
  backgroundColor: animation.value,
  ...
);
```

|iOS|Android|
|---|---|
|![Color Animation iOS](/screenshots/iphone14ProMax_5.gif)|![Color Animation Android](/screenshots/nexus6_5.gif)|

Since flutter is open source there are many packages that can be used to create animations. One of them is **[Animated Text Kit](https://pub.dev/packages/animated_text_kit)**. Animated Text Kit is a package that provides many types of text animations.

We are going to use **`AnimatedTextKit`** to create a typing animation.

```dart
AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText(
      speed: const Duration(
        milliseconds: 50,
      ),
      'Flash Chat',
      textStyle: const TextStyle(
        fontSize: 45.0,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
  ],
),
```

|iOS|Android|
|---|---|
|![Typing Animation iOS](/screenshots/iphone14ProMax_6.gif)|![Typing Animation Android](/screenshots/nexus6_6.gif)|
