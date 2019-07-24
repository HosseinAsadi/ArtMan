import 'package:art_man/page/JoinedPage.dart';
import 'package:art_man/page/MuscleGroupList.dart';
import 'package:art_man/page/PlanPage.dart';
import 'package:art_man/page/PlanSport.dart';
import 'package:art_man/page/SaveAnalyze.dart';
import 'package:art_man/page/SelectSportExtract.dart';
import 'package:art_man/page/SplashScreenPage.dart';
import 'package:art_man/page/SportField.dart';
import 'package:art_man/page/StdAnalyzePage.dart';
import 'package:art_man/page/StdAnalyzePage4.dart';
import 'package:art_man/page/StdAnalyzePage6.dart';
import 'package:art_man/page/StdInformationPage.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.yellow,

      ),
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

        '/':(context) => SelectSportExtract(),
        '/StdPropertyBody': (context) => StdPropertyBody(),
        '/signinpage': (context) => MyCustomForm(),
        '/signuppage': (context) => SignUp(),
        '/verifypage': (context) => VerifyPage(),
        '/joindepage': (context) => JoinedPage(),
        '/TeacherProfilePage': (context) => TeacherProfilePage(),
        '/StdAnalyzePage': (context) => StdAnalyzePage(),
        '/StdAnalyzePage4': (context) => StdAnalyzePage4(),
        '/StdAnalyzePage6': (context) => StdAnalyzePage6(),
        '/SaveAnalyze': (context) => SaveAnalyze(),
        '/StdInformationPage': (context) => StdInformationPage(),
        '/PlanePage': (context) => PlanePage(),
        '/MuscleGroupList': (context) => MuscleGroupList(),
        '/SportField': (context) => SportField(),
        '/SelectSportExtract': (context) => SelectSportExtract(),
      },
    );
  }
}


