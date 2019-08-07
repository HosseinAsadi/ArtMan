import 'package:art_man/page/Analyzes/StdAnalyzePage.dart';
import 'package:art_man/page/Analyzes/StdAnalyzePage4.dart';
import 'package:art_man/page/Analyzes/analyze1.dart';
import 'package:art_man/page/Analyzes/analyze2.dart';
import 'package:art_man/page/Analyzes/analyze5.dart';
import 'package:art_man/page/Analyzes/analyze6.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SlidigForms extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
       // primaryColor: Colors.black
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("آنالیز هنرجو",style: TextStyle(color: Colors.white),),
      ),
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: new SimpleWidget(),
    ));
  }
}

class SimpleWidget extends StatefulWidget {
  @override
  SimpleWidgetState createState() => new SimpleWidgetState();
}

class SimpleWidgetState extends State<SimpleWidget> {
  int stepCounter = 0;
  List<Step> steps;
  @override
  Widget build(BuildContext context) {

    return  Container(
      child: new Stepper(
        onStepCancel: (){
          setState(() {
           stepCounter>0? stepCounter-=1:stepCounter=stepCounter;
          });
        },
        physics: ScrollPhysics(),
        currentStep: this.stepCounter,
        steps: Steps(),
        type: StepperType.horizontal,
        onStepContinue: () {
          setState(() {
            stepCounter < steps.length - 1 ? stepCounter += 1 : stepCounter = 0;
          });
        },
      ),
    );
  }
  Steps() {
     steps = [
      new Step(
        title: new Text(""),
        content:Analyze6(),

        isActive: stepCounter>=0,
      ),
      new Step(
        title: new Text(""),
        content:StdAnalyzePage() ,
        isActive: stepCounter>=1,
      ),
      new Step(
        title: new Text(""),
        content: StdAnalyzePage4(),
        isActive: stepCounter>=2,
      ),
      new Step(
        title: new Text(""),
        content: Analyze5(),
        isActive: stepCounter>=3,

      ),
      new Step(
        title: new Text(""),
        content: Analyze1(),
        isActive: stepCounter>=4,

      ),
      new Step(
        title: new Text(""),
        content:  Analyze2(),
        isActive: stepCounter>=5,

      ),
    ];
    return steps;
  }
}
