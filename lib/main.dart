import 'package:art_man/page/JoinedPage.dart';
import 'package:art_man/page/SplashScreenPage.dart';
import 'package:art_man/page/StdAnalyzePage.dart';
import 'package:art_man/page/StdAnalyzePage4.dart';
import 'package:art_man/page/StdAnalyzePage6.dart';
import 'package:art_man/page/StdPropertyPage.dart';
import 'package:art_man/page/SingInPage.dart';
import 'package:art_man/page/SignUpPage.dart';
import 'package:art_man/page/TeacherProfilePage.dart';
import 'package:art_man/page/VerifyPage.dart';
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
        '/':(context) => StdAnalyzePage6(),
        '/StdPropertyBody': (context) => StdPropertyBody(),
        '/signinpage': (context) => MyCustomForm(),
        '/signuppage': (context) => SignUp(),
        '/verifypage': (context) => VerifyPage(),
        '/joindepage': (context) => JoinedPage(),
        '/TeacherProfilePage': (context) => TeacherProfilePage(),
        '/StdAnalyzePage': (context) => StdAnalyzePage(),
        '/StdAnalyzePage4': (context) => StdAnalyzePage4(),

      },
    );
  }
}


