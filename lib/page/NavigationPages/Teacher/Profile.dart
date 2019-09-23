import 'package:art_man/blocs/TeacherProfile/ProfileEvent.dart';
import 'package:art_man/blocs/TeacherProfile/profile_bloc.dart';
import 'package:art_man/components/InputTexts/MaterialText.dart';
import 'package:art_man/components/InputTexts/OnlineInputText.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/Loading.dart';
import 'package:art_man/components/Utility/GetTeacherProfile.dart';
import 'package:flutter/material.dart';
import '../../EmptyPage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _profilebloc=ProfileBloc();
  Strings strings=new Strings();

  @override
  void initState() {

    super.initState();
    _profilebloc.profileEventSink.add(SetEvent());

  }
  @override
  Widget build(BuildContext context) {

    return Material(
        type: MaterialType.transparency,
        child:  Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),

      child: StreamBuilder(
        stream: _profilebloc.Profile,
        builder: (BuildContext context,AsyncSnapshot<TeacherPro> snapshot)
    {

      return snapshot.data.fill? Container(

          margin: EdgeInsets.all(20),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, "/Uploader");
                    },
                    child: ClipRRect(
                      child: "" == "${snapshot.data.imagename}"
                          ? Image.asset(
                          "assets/images/morabi.png")
                          : Image.network(
                          "${strings
                              .baseurl}/images/teachers/${snapshot.data.imagename}"),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)),
                    ),
                  ),
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 20, left: 15),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: <Widget>[
                        text(snapshot.data.name, FontWeight.w800,
                            24.0),
                        OnlineInputText(
                          color: Colors.white
                              .withOpacity(0.0),
                          hintconlor: Colors.white,
                          radius: 40.0,
                          hintsize: 12.0,
                          maxlines: 1,
                          hint: snapshot.data.bio == ""
                              ? "بیوگرافی ...."
                              : snapshot.data.bio,
                          right: 4.0,
                          top: 6.0,
                          iconsize: 13.0,
                          fileforsend: "bio",
                          id: "bio",
                          textcolor: Colors.black,
                          height: 25.0,
                        ),
                        text("آیدی مربی :",
                            FontWeight.w800, 14.0),
                        id,
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsets.all(10),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Expanded(
                              child: text(
                                  '${snapshot.data.country} ، ${snapshot.data.city}',
                                  FontWeight.w300,
                                  14.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            text(
                "درباره ی من :", FontWeight.w500, 17.0),
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: 5,
                      bottom: 20,
                      top: 5,
                      right: 5),
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(10))),
                  child: new OnlineInputText(
                    color:
                    Colors.white.withOpacity(0.0),
                    hintconlor: Colors.black,
                    radius: 40.0,
                    hintsize: 12.0,
                    maxlines: 8,
                    hint: snapshot.data.about == ""
                        ? "توضیحات  ...."
                        : snapshot.data.about,
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
                                      text: snapshot.data.about,
                                    ),
                              ));
                        },
                        child: Text(
                          "نمایش بیشتر",
                          style: TextStyle(
                              fontWeight:
                              FontWeight.w700,
                              fontSize: 15,
                              color: Colors.green),
                        ))),
              ],
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                children: <Widget>[
                  text(
                      "زمان مورد انتظار برای ارسال برنامه :",
                      FontWeight.w600,
                      15.0),
                  Expanded(
                    flex: 1,
                    child: time,
                  )
                ],
              ),
            ),
          ],
        ),
      ):Loading();}),
        )) ;
  }
  text(text, fontwidth, fontsize) =>
      Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontWeight: fontwidth, fontSize: fontsize),
      );
  MaterialText time = new MaterialText(
    30.0,
    "10 روز",
    Colors.white,
    backgroundColor: Color(0xFF71C105),
    right: 10,
  );
  MaterialText id  = new MaterialText(
  20.0,
  "یوزر نیم باید وارد شود",
  Colors.black,
  fontWeight: FontWeight.w500,
  fontsize: 14,
  );

}

