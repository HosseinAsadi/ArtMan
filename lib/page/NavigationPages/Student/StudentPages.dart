import 'package:art_man/blocs/bottomNavigationBarIndex/index_bloc.dart';
import 'package:art_man/page/NavigationPages/Teacher/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:art_man/blocs/bottomNavigationBarIndex/CounterEvent.dart';

import 'package:art_man/page/NavigationPages/Teacher/PlansPAGE.dart';

class Pages extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  final _bloc=BottomNavigationIndexBloc();

  final pagesRouteFactories = {
    "/": () => MaterialPageRoute(
      builder: (context) => Center(
        child: Profile(),
      ),
    ),
    "برنامه ها": () => MaterialPageRoute(
      builder: (context) => Center(
        child: PlansPAGE(),
      ),
    ),
    "مربیان": () => MaterialPageRoute(
      builder: (context) => Center(
        child: PlansPAGE(),
      ),
    ),
    "آنالیز": () => MaterialPageRoute(
      builder: (context) => Center(
        child: Text("Landing",style: Theme.of(context).textTheme.body1,),
      ),
    ),
    "اطلاعات": () => MaterialPageRoute(
      builder: (context) => Center(
        child: Text("Settings",style: Theme.of(context).textTheme.body1,),
      ),
    ),
  };

  @override
  Widget build(BuildContext context) => MaterialApp(

    home: Scaffold(

      appBar: AppBar(backgroundColor: Colors.green,),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    ),
  );

  Widget _buildBody() =>
      MaterialApp(
          navigatorKey: navigatorKey,
          onGenerateRoute: (route) => pagesRouteFactories[route.name](),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("fa", "IR"),
        ],
        locale: Locale("fa", "IR"),
      );

  Widget _buildBottomNavigationBar(context) => StreamBuilder(
  stream: _bloc.Counter,
  initialData: 0,
  builder: (BuildContext context,AsyncSnapshot<int> snapshot)
  {return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: snapshot.data,
    selectedItemColor: Colors.green[900],
    selectedFontSize: 16,

    items: [
      _buildBottomNavigationBarItem("پروفایل", Icons.person_pin),
      _buildBottomNavigationBarItem("برنامه ها",Icons.developer_board),
      _buildBottomNavigationBarItem("مربیان",Icons.people),
      _buildBottomNavigationBarItem("آنالیز", Icons.move_to_inbox),
      _buildBottomNavigationBarItem("اطلاعات", Icons.info)
    ],
    onTap: (routeIndex) {
      navigatorKey.currentState.pushNamed(pagesRouteFactories.keys.toList()[routeIndex]);
      _bloc.counterEventSink.add(SetEvent(routeIndex));
    }

  );});

  _buildBottomNavigationBarItem(name, icon) => BottomNavigationBarItem(
      icon: Icon(icon), title: Text(name), backgroundColor: Colors.black45);
}
