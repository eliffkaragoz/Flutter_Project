import 'package:flutter/material.dart';
import 'package:staj/core/services/storageUtil.dart';
import 'package:staj/ui/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staj/ui/view/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
