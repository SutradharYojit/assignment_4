import 'package:assignment_4/routes/route.dart';
import 'package:flutter/material.dart';
import '../view/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
