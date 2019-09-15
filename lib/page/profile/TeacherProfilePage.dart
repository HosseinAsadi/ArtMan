import 'package:art_man/components/Buttons/profile-button.dart';
import 'package:art_man/components/InputTexts/MaterialText.dart';
import 'package:art_man/components/InputTexts/OnlineInputText.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/EmptyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  TeacherProfile information;
  String name;
  String country;
  String city;
  String about;
  String bio;
  bool complete = false;
  String username;
  String imagename;
  List<String> students;

  var _key = GlobalKey<ScaffoldState>();

  MaterialText id;
  MaterialText time = new MaterialText(
    30.0,
    "10 روز",
    Colors.white,
    backgroundColor: Color(0xFF71C105),
    right: 10,
  );

  Strings strings = new Strings();

  getInformation() async {
    username = await getusername();
    print("${strings.baseurl}/teachers/getTeacher/$username");

    TeacherProfile info = await GetLocation.fetchProfileTeacher(
        "${strings.baseurl}/teachers/getTeacher/$username");

    setState(() {
      information = info;
      setState(() {
        name = information.result[0].firstname;
        country = information.result[0].country;
        city = information.result[0].city;
        about = information.result[0].about;
        imagename = information.result[0].profilephoto;
        bio = information.result[0].biografi;
        students = information.result[0].users_id;
      });
      id = new MaterialText(
        20.0,
        username,
        Colors.black,
        fontWeight: FontWeight.w500,
        fontsize: 14,
      );
      complete = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getInformation();
  }

  Future<Null> onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
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
    return students;
  }

  @override
  Widget build(BuildContext context) {
    //  debugPaintSizeEnabled=true;

    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          key: _key,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: complete
                ? ListView(
                    shrinkWrap: false,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/Uploader");
                                      },
                                      child: ClipRRect(
                                        child: "" == "$imagename"
                                            ? Image.asset(
                                                "assets/images/morabi.png")
                                            : Image.network(
                                                "${strings.baseurl}/images/teachers/$imagename"),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                    ),
                                    width: 100,
                                    height: 100,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 20, left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          text(name, FontWeight.w800, 24.0),
                                          OnlineInputText(
                                            color:
                                                Colors.white.withOpacity(0.0),
                                            hintconlor: Colors.white,
                                            radius: 40.0,
                                            hintsize: 12.0,
                                            maxlines: 1,
                                            hint: bio == ""
                                                ? "بیوگرافی ...."
                                                : bio,
                                            right: 4.0,
                                            top: 6.0,
                                            iconsize: 13.0,
                                            fileforsend: "bio",
                                            id: "bio",
                                            textcolor: Colors.black,
                                            height: 25.0,
                                          ),
                                          text("آیدی مربی :", FontWeight.w800,
                                              14.0),
                                          id,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                              Expanded(
                                                child: text('$country ، $city',
                                                    FontWeight.w300, 14.0),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              text("درباره ی من :", FontWeight.w500, 17.0),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: new OnlineInputText(
                                      color: Colors.white.withOpacity(0.0),
                                      hintconlor: Colors.black,
                                      radius: 40.0,
                                      hintsize: 12.0,
                                      maxlines: 8,
                                      hint:
                                          about == "" ? "توضیحات  ...." : about,
                                      right: 4.0,
                                      top: 6.0,
                                      iconsize: 20.0,
                                      fileforsend: "about",
                                      id: "about",
                                      textcolor: Colors.black,
                                      height: 150.0,
                                      length: 1500.0,
                                    ),
                                  ),
                                  new Positioned(
                                      bottom: 2,
                                      left: 5,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EmptyPage(
                                                        text: about,
                                                      ),
                                                ));
                                          },
                                          child: Text(
                                            "موارد بیشتر",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: Colors.green),
                                          ))),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: Row(
                                  children: <Widget>[
                                    text("زمان مورد انتظار برای ارسال برنامه :",
                                        FontWeight.w600, 15.0),
                                    Expanded(
                                      flex: 1,
                                      child: time,
                                    )
                                  ],
                                ),
                              ),
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
                              ProfileButton("خروج از حساب کاربری",
                                  Icons.exit_to_app, Color(0xFF4B4F4B), "/")
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Container(
                    width: 40,
                    height: 40,
                  )),
          ),
        ));
  }

  text(text, fontwidth, fontsize) => Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontWeight: fontwidth, fontSize: fontsize),
      );
}
