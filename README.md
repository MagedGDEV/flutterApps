# Cubit

This is part **ONE** of a series of tutorials that will be used to demonstrate how to use the ***[flutter_bloc](https://pub.dev/packages/flutter_bloc)*** & ***[bloc](https://pub.dev/packages/bloc)*** packages to manage the state of a Flutter application.

First we will start with a simple application that lets the user pick a random name from a stored list of names.

It will demonstrate the following concepts:

- How to create a **cubit** to manage the state of the application using the ***flutter_bloc*** & ***bloc*** packages.
- How to add **extension** to a class.

|iOS|Android|
|---|-------|
|![iOS](/screenshots/iphone14ProMax_cubit.gif)|![Android](/screenshots/nexus6_cubit.gif)|

## Tutorial

**extension** is a new feature in Dart 2.7 that allows you to add new functionality to existing classes.

In the example below we are adding **`getRandomElement`** to **Iterable** class so that we can use it to get a random element from any type of list.

```dart
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
```

**Cubit** is a state management class which helps manage the state of the application, it works by emitting a new state whenever the state of the application changes.

### Step 1 - Create a Cubit

In this step we will add the functionality we need cubit to manage.

```dart
class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(
        names.getRandomElement(),
      );
}
```

In the code above we created a **`NamesCubit`** class that extends **`Cubit<String?>`** to generate a random name from a list of names.

### Step 2 - Create a cubit instance

In this step we will create an instance of the cubit we created in the previous step inside our stateful widget.

> Note: we can also use stateless widget but we won't be able to control the lifecycle of the widget

```dart
late final NamesCubit cubit;

@override
  void initState() {
    super.initState();
    cubit = NamesCubit();
}
```

### Step 3 - Use the cubit

In this step we will control the state of the application using the cubit we created in the previous step.

```dart
StreamBuilder<String?>(
  stream: cubit.stream,
  builder: (context, snapshot) {
    final button = TextButton(
      onPressed: () => cubit.pickRandomName(),
      child: const Text(
        'Pick a random name',
        style: kHomeSizeTextStyle,
        ),
      );
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return button;
      case ConnectionState.waiting:
        return button;
      case ConnectionState.active:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data ?? '',
              style: kHomeSizeTextStyle,
            ),
            button,
          ],
        );
      case ConnectionState.done:
        return const SizedBox();
    }
  },
)
```

In the code above we used **`StreamBuilder`** to listen to the stream of the cubit and rebuild the UI whenever the state of the application changes.

Cubit emits the following states:

- **`ConnectionState.none`** when the cubit is created.
- **`ConnectionState.waiting`** when the cubit is waiting for the first state to be emitted.
- **`ConnectionState.active`** when the cubit is emitting a new state.
- **`ConnectionState.done`** when the cubit is closed.

> [!NOTE]
> **StreamBuilder** is explained in detail in the **[Flash_Chat tutorial](https://github.com/MagedGDEV/flutterApps/tree/flash_chat)**

### Step 4 - Close the cubit

Finally we need to close the cubit when the widget is disposed, because we don't want to keep the cubit open when the widget is not in the widget tree.

```dart
@override
void dispose() {
  cubit.close();
  super.dispose();
}
```

Star the repo to keep yourself updated with the next part of the tutorial.
