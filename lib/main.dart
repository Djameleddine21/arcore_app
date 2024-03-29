import 'package:arcore_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AR Core App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
