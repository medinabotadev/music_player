import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier{
  bool _playing = false;
  Duration _songDuration = Duration(milliseconds: 0);
  Duration _current      = Duration(milliseconds: 0);
  late AnimationController _controller;

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get porcentaje => (_songDuration.inSeconds > 0) 
                            ? _current.inSeconds / _songDuration.inSeconds
                            : 0;

  set controller(AnimationController valor){
    _controller = valor;
  }

  AnimationController get controller => _controller;

  bool get playing => _playing;
  set playing(bool valor){
    _playing = valor;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;
  set songDuration(Duration valor){
    _songDuration = valor;
    notifyListeners();
  }

  Duration get current => _current;
  set current(Duration valor){
    _current = valor;
    notifyListeners();
  }

  String printDuration(Duration duration){
    String twoDigits(int n){
      if (n >= 10) return '$n';
        return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inMinutes.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}