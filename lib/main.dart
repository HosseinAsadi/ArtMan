import 'package:art_man/components/Networking/ImageUploader.dart';
import 'package:art_man/page/Analyzes/AnalyzeAwnser.dart';
import 'package:art_man/page/Analyzes/SummaryAnswer.dart';
import 'package:art_man/page/Analyzes/SaveAnalyze.dart';
import 'package:art_man/page/Analyzes/AnalyzeAnatomicimage.dart';
import 'package:art_man/page/Analyzes/AnalyzeProblems.dart';
import 'package:art_man/page/Analyzes/AnalyzeCheckup.dart';
import 'package:art_man/page/Analyzes/analyzeinfo1.dart';
import 'package:art_man/page/Analyzes/analyzeInfo2.dart';
import 'package:art_man/page/Analyzes/analyzeSicks.dart';
import 'package:art_man/page/Analyzes/analyzeDetailsInfo.dart';
import 'package:art_man/page/Analyzes/AnalyzeTools.dart';
import 'package:art_man/page/Analyzes/AnalyzeSetGoal.dart';
import 'package:art_man/page/FoodPlan/addSportPlan.dart';
import 'package:art_man/page/SportPlan/PlanPageStudent.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:art_man/page/SportPlan/PlanePageTeacher.dart';
import 'package:art_man/page/VideoAbout/ShowThumbnail.dart';
import 'package:art_man/page/VideoAbout/SplashScreenPage.dart';
import 'package:art_man/page/SportPlan/SportPlanePage.dart';
import 'package:art_man/page/VideoAbout/VideoPlayer.dart';
import 'package:art_man/page/Analyzes/StdInformationField.dart';
import 'package:art_man/page/description/StdPropertyPage.dart';
import 'package:art_man/page/description/coach-atributies-explanations.dart';
import 'package:art_man/page/lists/AnalyzesList.dart';
import 'package:art_man/page/lists/ListOfMovesInClassroom.dart';
import 'package:art_man/page/lists/ListOfPlansOfTeacher.dart';
import 'package:art_man/page/lists/MyTeachersList.dart';
import 'package:art_man/page/lists/SearchPage.dart';
import 'package:art_man/page/profile/TeacherProfileReadOnly.dart';
import 'package:art_man/page/signs/JoinedPage2.dart';
import 'package:art_man/page/description/monthly-payment.dart';
import 'package:art_man/page/SportPlan/MuscleGroupList.dart';
import 'package:art_man/page/SportPlan/SelectSportExtract.dart';
import 'package:art_man/page/SportPlan/SportField.dart';
import 'package:art_man/page/SportPlan/food-plan.dart';
import 'package:art_man/page/SportPlan/list-session.dart';
import 'package:art_man/page/profile/TeacherProfilePage.dart';
import 'package:art_man/page/profile/StudentProfile.dart';
import 'package:art_man/page/signs/JoinedPage.dart';
import 'package:art_man/page/signs/SignUpPage.dart';
import 'package:art_man/page/signs/SingInPage.dart';
import 'package:art_man/page/signs/VerifyPage.dart';
import 'package:art_man/page/signs/first-login.dart';
import 'package:art_man/page/signs/SignUpTeacher.dart';
import 'package:art_man/page/signs/sms-verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:art_man/page/SportPlan/ExtractSportName.dart';


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

        '/':(context) => SplashScreenPage(),
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
        '/Profile': (context) => ProfilePage(),
        '/FirstLogin': (context) => FirstLogin(),
        '/Register': (context) => Register(),
        '/SMSVerify': (context) => SMSVerify(),
        //'/SportPlanPage': (context) => SportPlanPage(),
        '/FoodPlan': (context) => FoodPlan(),
        '/ListSession': (context) => ListSession(),
        '/SearchPage': (context) => SearchPage(),
        '/Uploader': (context) => Uploader(),
        '/SaveAnalyze3': (context) => SaveAnalyze3(),
        '/TeacherProfileReadOnly': (context) => TeacherProfileReadOnly(),
        '/MyTeachers': (context) => MyTeachers(),
        '/AnalyzeAnswer': (context) => AnalyzeAnswer(),
        '/AnalyzeList': (context) => AnalyzeList(),
        '/AnalyzeResult': (context) => AnalyzeResult(),
        '/PlaneSportTeacher': (context) => PlaneSportTeacher(),
        '/MovesInClassroom': (context) => MovesInClassroom(),
        '/ListPlanOfTeacher': (context) => ListPlanOfTeacher(),
        '/AddMeal': (context) => AddMeal(),
      },
    );
  }
}


