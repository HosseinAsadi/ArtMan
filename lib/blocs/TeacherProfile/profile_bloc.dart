import 'dart:async';
import 'package:art_man/components/Utility/GetTeacherProfile.dart';
import 'ProfileEvent.dart';

class ProfileBloc{
  TeacherPro _info;
  final _ProfileStateContoroler= StreamController<TeacherPro>();
  StreamSink<TeacherPro> get _inCounter => _ProfileStateContoroler.sink;

  Stream<TeacherPro> get Profile => _ProfileStateContoroler.stream;

  final _profileEventController= StreamController<ProfileEvent>();

  Sink<ProfileEvent> get profileEventSink=> _profileEventController.sink;//

  ProfileBloc(){//get a fumction
    _profileEventController.stream.listen(_mapEventToState);
}

   void _mapEventToState (ProfileEvent event) {// the function that be renned when call
      if(event is SetEvent){

        getprofilee();
        _info=getprofile();
          _inCounter.add(_info);
      }
  }
  void dispose(){
    _profileEventController.close();
    _profileEventController.close();
  }
}
getprofilee() async {
  await Teacherformation();
}