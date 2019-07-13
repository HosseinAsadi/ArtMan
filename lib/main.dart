import 'package:flutter/material.dart';
import 'screens/first-login.dart';
import 'screens/coach-atributies-explanations.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/register.dart';
import 'screens/sms-verify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      title: 'Art Man Project',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => FirstLogin(),
        '/coach-explan': (BuildContext context) => CoachExplan(),
        '/register': (BuildContext context) => Register(),
        '/sms-verify': (BuildContext context) => SMSVerify(),
      },
    );
  }
}
