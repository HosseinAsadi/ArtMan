import 'package:art_man/components/ImageAbout/ImageSetting.dart';
import 'package:art_man/page/Analyzes/SaveAnalyze.dart';
import 'package:art_man/page/Analyzes/StdAnalyzePage.dart';
import 'package:art_man/page/Analyzes/StdAnalyzePage4.dart';
import 'package:art_man/page/Analyzes/StdAnalyzePage6.dart';
import 'package:art_man/page/Analyzes/analyze1.dart';
import 'package:art_man/page/Analyzes/analyze2.dart';
import 'package:art_man/page/Analyzes/analyze5.dart';
import 'package:art_man/page/Analyzes/analyze6.dart';
import 'package:art_man/page/Analyzes/save-analyze0.dart';
import 'package:art_man/page/PlanPage.dart';
import 'package:art_man/page/PlanSport.dart';
import 'package:art_man/page/ShowThumbnail.dart';
import 'package:art_man/page/SplashScreenPage.dart';
import 'package:art_man/page/SportPlanePage.dart';
import 'package:art_man/page/VideoPlayer.dart';
import 'package:art_man/page/description/StdInformationPage.dart';
import 'package:art_man/page/description/StdPropertyPage.dart';
import 'package:art_man/page/description/coach-atributies-explanations.dart';
import 'package:art_man/page/description/membership.dart';
import 'package:art_man/page/description/monthly-payment.dart';
import 'package:art_man/page/lists/MuscleGroupList.dart';
import 'package:art_man/page/lists/SelectSportExtract.dart';
import 'package:art_man/page/lists/SportField.dart';
import 'package:art_man/page/lists/food-plan.dart';
import 'package:art_man/page/lists/list-session.dart';
import 'package:art_man/page/profile/TeacherProfilePage.dart';
import 'package:art_man/page/profile/profile.dart';
import 'package:art_man/page/signs/JoinedPage.dart';
import 'package:art_man/page/signs/SignUpPage.dart';
import 'package:art_man/page/signs/SingInPage.dart';
import 'package:art_man/page/signs/VerifyPage.dart';
import 'package:art_man/page/signs/first-login.dart';
import 'package:art_man/page/signs/register.dart';
import 'package:art_man/page/signs/sms-verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/ImageAbout/ImageUploader.dart';
import 'page/ExtractSportName.dart';


void main() {
  debugPaintSizeEnabled = false;
 return runApp(MyApp());
}

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

        '/':(context) => Uploader(),
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
        '/PlanSport': (context) => PlanSport(),
        '/MuscleGroupList': (context) => MuscleGroupList(),
        '/SportField': (context) => SportField(),
        '/SelectSportExtract': (context) => SelectSportExtract(),
        '/ExtractSportName': (context) => ExtractSportName(),
        '/VideoPlayerApp': (context) => VideoPlayerApp(),
        '/Show': (context) => Show(),
        '/Analyze1': (context) => Analyze1(),
        '/Analyze2': (context) => Analyze2(),
        '/Analyze5': (context) => Analyze5(),
        '/Analyze6': (context) => Analyze6(),
        '/SaveAnalyzee': (context) => SaveAnalyzee(),
        '/CoachExplan': (context) => CoachExplan(),
        '/Membership': (context) => Membership(),
        '/MonthlyPayment': (context) => MonthlyPayment(),
        '/Profile': (context) => Profile(),
        '/FirstLogin': (context) => FirstLogin(),
        '/Register': (context) => Register(),
        '/SMSVerify': (context) => SMSVerify(),
        '/SportPlanPage': (context) => SportPlanPage(),
        '/FoodPlan': (context) => FoodPlan(),
        '/ListSession': (context) => ListSession(),
    ImageSetting.routeName: (context) => ImageSetting(),
      },
    );
  }
}


