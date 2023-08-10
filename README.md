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

> ***hint:*** to control the height of the modal sheet, use the **`isScrollControlled`** property and wrap the content in a **`SingleChildScrollView`** widget to be above the keyboard.

```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  builder: (context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const AddTask(),
    ),
  ),
);
```

|iOS|Android|
|---|---|
|![iOS_ModalSheet](/screenshots/iphone14ProMax_2.gif)|![Android_ModalSheet](/screenshots//nexus6_2.gif)|

**Callbacks** are functions that are passed as arguments to another function. They are used to pass data between widgets, and they are used to trigger a function in a parent widget from a child widget, such as in the example below we are triggering a function in TaskTile stateful widget from the TaskCheckbox stateless widget.

```dart
class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Item',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
        isCheckedState: isChecked,
        toggleCheckboxState: (bool? checkboxState) {
          setState(() {
            isChecked = checkboxState!;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool isCheckedState;

  final void Function(bool?) toggleCheckboxState;
  const TaskCheckbox({
    super.key,
    required this.isCheckedState,
    required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isCheckedState,
      onChanged: toggleCheckboxState,
    );
  }
}
```

|iOS|Android|
|---|---|
|![iOS_Callbacks](/screenshots/iphone14ProMax_3.gif)|![Android_Callbacks](/screenshots//nexus6_3.gif)|