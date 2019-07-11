import 'package:flutter/material.dart';
import 'screens/first-login.dart';
import 'screens/coach-atributies-explanations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Man Project',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => FirstLogin(),
        '/coach-explan': (BuildContext context) => CoachExplan(),
      },
    );
  }
}
