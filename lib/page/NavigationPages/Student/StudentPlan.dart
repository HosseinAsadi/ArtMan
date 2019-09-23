import 'dart:ui';
import 'package:art_man/blocs/BlurScreen/bloc_bloc.dart';
import 'package:art_man/components/Buttons/profile-button.dart';
import 'package:flutter/material.dart';

class PlansPAGE extends StatelessWidget {
  final _blurbloc = BlurBloc();
  callback() {
    /*myStudenst = students;
    return students;*/
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child:Center(child:Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[

                              ProfileButton(
                                  "برنامه های تمرینی ",
                                  Icons.developer_board,
                                  Color(0xFF088B00),
                                  "/PlaneSportTeacher"),
                              ProfileButton(
                                "برنامه های غذایی",
                                Icons.featured_play_list,
                                Color(0xFF71C105),
                                "/MyStudents",
                                callback: this.callback,
                              ),
                              ProfileButton("آخرین برنامه غذایی", Icons.group_work,
                                  Color(0xFF088B00), "/SportField"),
                              ProfileButton("آخرین برنامه تمرینی", Icons.group_work,
                                  Color(0xFF71C105), "/SportField"),

                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Center(
                child: StreamBuilder(
                    stream: _blurbloc.blurtype,
                    initialData: false,
                    builder: (BuildContext context,
                        AsyncSnapshot<bool> snapshot) {
                      return ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX:snapshot.data?2.7:0,
                            sigmaY: snapshot.data?2.7:0,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            child: Text(''),
                          ),
                        ),
                      );
                    }),
              ),
            ],
         ) ));
  }
}
