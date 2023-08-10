# todoey

**ListTile** is a widget that is used to display a list of information. It is a single fixed-height row that typically contains some text widgets as well as a leading or trailing widgets.

**leading** a widget to display before the title., **title** the primary content of the list tile., **subtitle** additional content displayed below the title., **trailing** a widget to display after the title.

**Checkbox** is a widget that is used to select one or more options from a set of options. It is a material widget that is displayed as a box with a tick mark when it is selected.

```dart
ListTile(
  title: const Text('Item'),
  trailing: Checkbox(
    value: true,
    onChanged: (bool? value) {},
  ),
);
```

|iOS|Android|
|---|---|
|![iOS_ListTile](/screenshots/iphone14ProMax_1.png)|![Android_ListTile](/screenshots//nexus6_1.png)|

**showModalBottomSheet** is a function that is used to display a modal bottom sheet. It is a material widget that slides up from the bottom of the screen to reveal more content.

```dart
showModalBottomSheet(
  context: context,
  builder: (context) => const AddTask(),
);
```

|iOS|Android|
|---|---|
|![iOS_ModalSheet](/screenshots/iphone14ProMax_2.gif)|![Android_ModalSheet](/screenshots//nexus6_2.gif)|
