import 'dart:async';

import 'BlurEvent.dart';



class BlurBloc{
  bool _blur=false;
  final _blurStateContoroler= StreamController<bool>();
  StreamSink<bool> get _inCounter => _blurStateContoroler.sink;

  Stream<bool> get blurtype => _blurStateContoroler.stream;

  final _blurEventController= StreamController<BlurEvent>();

  Sink<BlurEvent> get blurEventSink=> _blurEventController.sink;//

  BottomNavigationIndexBloc(){//get a fumction
    _blurEventController.stream.listen(_mapEventToState);
}

   void _mapEventToState (BlurEvent event) {// the function that be renned when call
      if(event is ableEvent){
        _blur=true;

      }
      else{
        _blur=false;
      }
      _inCounter.add(_blur);
  }
  void dispose(){
    _blurEventController.close();
    _blurEventController.close();
  }
}