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
