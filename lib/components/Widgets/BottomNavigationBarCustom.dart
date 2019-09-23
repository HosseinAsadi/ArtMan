import 'package:art_man/blocs/bottomNavigationBarIndex/CounterEvent.dart';
import 'package:art_man/blocs/bottomNavigationBarIndex/index_bloc.dart';
import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/page/NavigationPages/Teacher/PlansPAGE.dart';
import 'package:art_man/page/NavigationPages/Teacher/Profile.dart';
import 'package:flutter/material.dart';
class BottomNavigationBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc=BottomNavigationIndexBloc();
    return StreamBuilder(
        stream: _bloc.Counter,
        initialData: 0,
        builder: (BuildContext context,AsyncSnapshot<int> snapshot)
        {
          return  BottomNavigationBar(

            backgroundColor: Colors.greenAccent,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.green[900],
            selectedFontSize: 16,

            elevation: 20,
            currentIndex: snapshot.data,
            iconSize: 27,
            onTap: (value){
              _bloc.counterEventSink.add(SetEvent(value));
              if(value==0){
                Navigator.push(context, SlideRightRoute(page: Profile()));
              }
              if(value==1){
                Navigator.push(context, SlideRightRoute(page: PlansPAGE()));
              }
              if(value==2){
                Navigator.push(context, SlideRightRoute(page: PlansPAGE()));
              }
              if(value==3){
                Navigator.push(context, SlideRightRoute(page: PlansPAGE()));
              }
            },


            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_pin,
                  ),
                  title: Text("پروفایل")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.developer_board,
                  ),
                  title: Text("برنامه ها")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.move_to_inbox,
                  ),
                  title: Text("درخواست ها")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.info,
                  ),
                  title: Text("اطلاعات")),
            ],
          );});
  }

}
