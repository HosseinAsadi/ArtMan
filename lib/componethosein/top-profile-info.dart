import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';
class TopProfile extends StatefulWidget {


   @override
  _TopProfileState createState() => _TopProfileState();
}

class _TopProfileState extends State<TopProfile> {
  String username;
  String name;
  String country;
  String city;
  String imagename;
  bool complete=false;
  StdProfile information;
  Strings strings=new Strings();

  _getInformation() async {
    Strings strings=new Strings();

    username = await getusername();

    StdProfile info = await GetLocation.fetchProfilestudent(
        "${strings.baseurl}/users/getUser/$username");
    print("${strings.baseurl}/users/getUser/$username");
    setState(() {
      information = info;

      setState(() {

        name = information.result[0].firstname;
        country = information.result[0].country;
        city = information.result[0].city;
        imagename = information.result[0].profilephoto;
      });

      complete = true;
    });
  }
  @override
  void initState() {
    super.initState();
    _getInformation();
  }
  @override
  Widget build(BuildContext context) {
    return  complete? Container(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        children: <Widget>[
          Container(width: 100,height: 100,child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/Uploader");



            },
            child:ClipRRect(
              child: "" == "$imagename"
                  ? Image.asset(
                  "assets/images/morabi.png")
                  : Image.network(
                  "${strings.baseurl}/images/users/$imagename"),
              borderRadius: BorderRadius.circular(25),
            ),
          ) ,)
         ,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 8),
                child: Text(name,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 8),
                child: Text(' کدکاربر: $username',
                    style: TextStyle(color: Colors.white, fontSize: 15)
                ),
              ),

              Container(
                  margin: EdgeInsets.only(right: 30, bottom: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white,size: 10),
                      Text(' $country ، $city',
                          style: TextStyle(color: Colors.white, fontSize: 10)
                      ),
                    ],
                  )
              ),
            ],
          )
        ],
      ),
    ):Center(
        child: Container(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ));
  }
}

