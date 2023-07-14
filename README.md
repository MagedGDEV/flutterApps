# mi_card

This is a simple business card app.

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

