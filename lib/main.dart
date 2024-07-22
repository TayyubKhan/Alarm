import 'package:alarm/View/HomeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

  double height = 0.0;
  double width = 0.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   width = MediaQuery.sizeOf(context).width;
   height = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
