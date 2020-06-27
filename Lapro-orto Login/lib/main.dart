import 'package:flutter/material.dart';
import 'package:flutter_secret_chat/pages/RegistroUsers.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        "login":(context)=>LoginPage(),
        "Registro":(context)=>RegistroPage()
      },
    );
  }
}

