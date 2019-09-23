import 'dart:ui';
import 'package:art_man/blocs/BlurScreen/bloc_bloc.dart';
import 'package:art_man/blocs/bottomNavigationBarIndex/index_bloc.dart';
import 'package:art_man/components/Buttons/profile-button.dart';
import 'package:art_man/components/Widgets/BottomNavigationBarCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  final _bloc = BottomNavigationIndexBloc();
  final _blurbloc = BlurBloc();

  var _key = GlobalKey<ScaffoldState>();


  Future<Null> onWillPop() {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        content: new Text('آیا مطمئنید میخواهید از برنامه خارج شوید؟'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text(
              'خیر',
              style: TextStyle(color: Colors.red),
            ),
          ),
          new FlatButton(
            onPressed: () => SystemNavigator.pop(),
            child:
            new Text('بله', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ) ??
        false;
  }
  callback() {
    /*myStudenst = students;
    return students;*/
  }

  @override
  Widget build(BuildContext context) {
    //  debugPaintSizeEnabled=true;

    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          key: _key,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                       ListView(
                    shrinkWrap: false,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              ProfileButton(
                                  "برنامه تمرینی / غذایی",
                                  Icons.developer_board,
                                  Color(0xFF088B00),
                                  "/PlaneSportTeacher"),
                              ProfileButton(
                                "لیست هنرجویان",
                                Icons.featured_play_list,
                                Color(0xFF71C105),
                                "/MyStudents",
                                callback: this.callback,
                              ),
                              ProfileButton("دسته بندی", Icons.group_work,
                                  Color(0xFF088B00), "/SportField"),
                              ProfileButton(
                                  "خروج از حساب کاربری",
                                  Icons.exit_to_app,
                                  Color(0xFF4B4F4B),
                                  "/")
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
          ),
          bottomNavigationBar: BottomNavigationBarCustom(),
        ));
  }



  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    _blurbloc.dispose();
  }
}
