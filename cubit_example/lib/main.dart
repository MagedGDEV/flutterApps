import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math show Random;
import 'package:cubit_example/constants.dart';

void main() {
  runApp(MaterialApp(
    title: 'Cubit Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

const names = [
  'Maged',
  'Salma',
  'Ahmed',
  'Mohamed',
  'Amr',
  'Hassan',
  'Fatima',
  'Amina',
  'Yusuf',
  'Layla',
  'Nour',
  'Zainab',
  'Omar',
  'Lina',
  'Mariam',
  'Ali',
  'Khaled',
  'Sara',
  'Omar',
  'Sofia',
  'Yasmine',
  'Ibrahim',
  'Nadia',
  'Khalid',
  'Leila',
  'Youssef',
  'Sami',
  'Aisha',
  'Karim',
];

// You can continue adding more names as needed

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(
        names.getRandomElement(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = NamesCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Demo'),
      ),
      body: Center(
        child: StreamBuilder<String?>(
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}
