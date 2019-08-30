import 'package:art_man/components/Networking/CheckConnection.dart';
import 'package:flutter/material.dart';

class ConnectionAvailable extends StatefulWidget {
  @override
  _ConnectionAvailableState createState() => _ConnectionAvailableState();
}

class _ConnectionAvailableState extends State<ConnectionAvailable> {
  Color color=Colors.white;
  bool isconnect=false;
  connection() async {
    bool connect= await checkConnection();
    setState(() {
      isconnect=connect;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: (){
                    setState(() {
                      connection();
                    });
                  },
                  onTapDown: (Details){
                    setState(() {
                      color=Colors.white.withOpacity(0.2);
                    });
                  },
                  onTapUp: (Details){
                    setState(() {
                      color=Colors.white;
                    });
                  },
                  child:Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 50,
                    ),
                  )
              ),
              Container(child: Text("شبکه در دسترس نیست لطفا دوباره تلاش کنید",style: TextStyle(
                  color: Colors.white,fontSize: 17
              ),),)
            ],
          )
      ),
    );
  }
}
