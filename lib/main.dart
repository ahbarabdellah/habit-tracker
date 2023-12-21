import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/home.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.openBox('Habits_Database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
