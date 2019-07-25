import 'package:flutter/material.dart';
import 'components/row-analyze5.dart';
import 'screens/first-login.dart';
import 'screens/coach-atributies-explanations.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/register.dart';
import 'screens/sms-verify.dart';
import 'screens/monthly-payment.dart';
import 'screens/membership.dart';
import 'screens/profile.dart';
import 'screens/analyze1.dart';
import 'screens/analyze2.dart';
import 'screens/analyze5.dart';
import 'screens/analyze6.dart';
import 'screens/save-analyze0.dart';
import 'screens/save-analyze3.dart';
import 'screens/summary.dart';
import 'screens/food-plan.dart';
import 'screens/list-session.dart';


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
        '/': (BuildContext context) => Summary(),
        '/coach-explan': (BuildContext context) => CoachExplan(),
        '/register': (BuildContext context) => Register(),
        '/sms-verify': (BuildContext context) => SMSVerify(),
        '/monthly-payment': (BuildContext context) => MonthlyPayment(),
        '/membership': (BuildContext context) => Membership(),
        '/profile': (BuildContext context) => Profile(),
        '/analyze1': (BuildContext context) => Analyze1(),
        '/analyze2': (BuildContext context) => Analyze2(),
        '/analyze5': (BuildContext context) => Analyze5(),
        '/saveanalyze0': (BuildContext context) => SaveAnalyze(),
        '/saveanalyze3': (BuildContext context) => SaveAnalyze3(),
        '/food-plan': (BuildContext context) => FoodPlan(),
        '/list-session': (BuildContext context) => ListSession(),
      },
    );
  }
}
