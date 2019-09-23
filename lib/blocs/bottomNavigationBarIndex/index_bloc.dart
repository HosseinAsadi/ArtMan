import 'dart:async';

import 'CounterEvent.dart';

class BottomNavigationIndexBloc{
  int _index=0;
  final _counterStateContoroler= StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateContoroler.sink;

  Stream<int> get Counter => _counterStateContoroler.stream;

  final _counterEventController= StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink=> _counterEventController.sink;//

  BottomNavigationIndexBloc(){//get a fumction
    _counterEventController.stream.listen(_mapEventToState);
}

   void _mapEventToState (CounterEvent event) {// the function that be renned when call
      if(event is SetEvent){
        _index=event.value;
          _inCounter.add(_index);
      }
  }
  void dispose(){
    _counterEventController.close();
    _counterEventController.close();
  }
}