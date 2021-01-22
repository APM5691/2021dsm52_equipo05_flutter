import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  bool _authenticated = false;
  bool get authenticated => _authenticated;
  void login({Map credentials}) {
    _authenticated = true;
    notifyListeners();
  }
}
