# todoey

This is a todo list application that allows the user to add tasks, mark them as done, and delete them on long press.

It teaches about the following topics:

- **ListTile** widget
- **Checkbox** widget
- **showModalBottomSheet** function
- Callbacks
- **ListView.builder** widget
- State management (**Provider** package)

|iOS|Android|
|---|---|
|![iOS](/screenshots/iphone14ProMax_0.gif)|![Android](/screenshots//nexus6_0.gif)|

## Tutorial

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

**ListView.builder** is a widget that is used to display a list of items. It is a material widget that is displayed as a scrollable list of children widgets, and it is used to display a large number of items efficiently, where the items are not necessarily all loaded into the memory at once. Only the items that are visible on the screen are loaded into the memory.

```dart
return ListView.builder(
  itemBuilder: (context, index) {
    return TaskTile(
        taskTitle: tasks[index].name,
        isChecked: tasks[index].isDone,
        checkboxCallBack: (bool? checked) {
          setState(() {
            tasks[index].toggleDone();
          });
        });
  },
  itemCount: tasks.length,
);
```

|iOS|Android|
|---|---|
|![iOS_ListViewBuilder](/screenshots/iphone14ProMax_4.png)|![Android_ListViewBuilder](/screenshots//nexus6_4.png)|

The state management is a technique that is used to manage the state of the application. It is used to manage the data that is displayed on the screen, and it is useful to keep code organized and easy to maintain. There are many state management techniques, such as the **Provider** package, the **BLoC** pattern, ...etc.

In this application, we are going to use the **[Provider](https://pub.dev/packages/provider)** package to manage the state of the application, where it helps in passing data between widgets and specific children, without the need to pass the data through the constructors of all widgets to reach the specific child, we needed to pass the data to.

**ChangeNotifier** is a class that is used to notify the listeners when the data is changed. It is a class that we extend to create our own class that is used to notify the listeners.

> We modify our data in the class using methods to be able to notify the listeners when the data is changed.

```dart
class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addNewTask(String taskTitle) {
    final newTask = Task(name: taskTitle);
    _tasks.add(newTask);
    notifyListeners();
  }

  void taskPressed(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
```

**ChangeNotifierProvider** is a widget that is used to provide the data to the widgets that are below it in the widget tree. **`create`** property is used to create an instance of the class that extends the **ChangeNotifier** class, and **`builder`** property is used to build the widgets that are below it in the widget tree, This needs to be done above all the widgets that are going to use the data.

```dart
ChangeNotifierProvider(
  create: (_) => TasksProvider(),
  builder: (context, child) {
    return const MaterialApp(
      home: TasksScreen(),
    );
  },
);
```

To access the data through the widgets, we use the **`Provider.of`** method, where we pass the context and the type of the data that we want to access, and we can use the data through the widget tree.

```dart
final tasksProvider = Provider.of<TasksProvider>(context);
```

To modify the data through the widgets, we use the **`context.read`** method, where we pass the context and the type of the data that we want to modify.

```dart
context.read<TasksProvider>().addNewTask(taskName!);
```

**Consumer** is a widget that is used to listen to the changes in the data, and it is used to rebuild the widgets that are below it in the widget tree when the data is changed, it helps in rebuilding only the widgets that are below it in the widget tree, and it is used to avoid rebuilding the whole widget tree, and good code organization.

```dart
Consumer<TasksProvider>(
  builder: (BuildContext context, data, Widget? child) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: data.tasks[index].name,
          isChecked: data.tasks[index].isDone,
          checkboxCallBack: (bool? checked) {
            data.taskPressed(index);
          },
          longPressCallBack: () {
            data.deleteTask(index);
          },
        );
      },
      itemCount: data.tasks.length,
    );
  },
);
```
