import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/componethosein/profile-button.dart';
import 'package:art_man/page/lists/MyStudents.dart';
import 'package:flutter/material.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';

class StudentProfileReadOnly extends StatefulWidget {
  final String username;

  StudentProfileReadOnly({Key key, @required this.username}) : super(key: key);

  @override
  _StudentProfileReadOnlyState createState() =>
      _StudentProfileReadOnlyState(username);
}

class _StudentProfileReadOnlyState extends State<StudentProfileReadOnly> {
  _StudentProfileReadOnlyState(this.username);

  String username;
  String name;
  String country;
  String city;
  String imagename;
  bool complete = false;
  StdProfile information;
  Strings strings = new Strings();
   callback(){
    return username;
  }
  _getInformation() async {
    Strings strings = new Strings();

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
  Future<Null> onWillPop() {
   Navigator.push(context, MaterialPageRoute(builder: (contex)=>MyStudents()));
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(

     body: complete
        ?
       Container(

       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage("assets/images/background.png"),
           fit: BoxFit.cover,
         ),
       ),
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        child: "" == "$imagename"
                            ? Image.asset("assets/images/profile.png")
                            : Image.network(
                                "${strings.baseurl}/images/users/$imagename"),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 30, bottom: 8),
                          child: Text(name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30, bottom: 8),
                          child: Text(' کدکاربر: $username',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 30, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.location_on,
                                    color: Colors.white, size: 10),
                                Text('$country ، $city',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10)),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
                ProfileButtone("آنالیزهای هنرجو", Icons.show_chart,
                    Colors.green[800], '/AnalyzeList',callback: this.callback,),
              ],
            ),
          ))
        : Center(
            child: Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
            ) )));
  }
}
