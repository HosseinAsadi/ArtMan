import 'package:art_man/page/SplashScreenPage.dart';
import 'package:art_man/page/StdPropertyPage.dart';
import 'package:art_man/page/SingInPage.dart';
/*import 'package:art_man/page/SignUpPage.dart';


import 'package:art_man/page/VerifyPage.dart';*/
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),

      title: 'art man',
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScreenPage(),
        '/StdPropertyBody': (context) => StdPropertyBody(),
        '/signinpage': (context) => MyCustomForm(),
        /*'/signuppage': (context) => SignUp(),
        '/verifypage': (context) => VerifyPage(),*/

      },
    );
  }
}


