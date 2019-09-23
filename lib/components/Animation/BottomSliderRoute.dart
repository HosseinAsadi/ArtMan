import 'package:flutter/material.dart';
class BottomSliderRoute extends PageRouteBuilder {
  final Widget page;
  BottomSliderRoute({this.page})
      : super(
    pageBuilder: (

        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (

        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>

        SlideTransition(

          position: Tween<Offset>(
            begin: const Offset(0, 100),
            end:Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}