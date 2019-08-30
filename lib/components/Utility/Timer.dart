import 'dart:async';

startTimer(start) {
  Timer _timer;
  const oneSec = const Duration(seconds: 1);
  _timer = new Timer.periodic(
    oneSec,
        (Timer timer) =>
          () {
        if (start < 1) {
          return true;

        } else {
            start = start - 1;
        }
      },
  );
}