
import 'package:flutter/material.dart';
import 'package:untitled/modules/register/register_screen.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: SchoolLoginScreen(),
    );
  }
}

