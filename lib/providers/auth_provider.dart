import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String _token = '';
  int _expires = 0;
  late Timer timer;

  bool get isAuth {
    return _token.isNotEmpty;
  }

  Future<void> _authentication(
      String email, String password, String type) async {
    const url = 'http://apiforlearning.zendvn.com/api/auth/login';

    try {
      final respone = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );

      final responeData = jsonDecode(respone.body);
      _token = responeData['access_token'];
      _expires = responeData['expires_in'];
      // _expires = 10;
      // lấy time hiện tại
      DateTime timeNow = DateTime.now();
      DateTime timeExpires = timeNow.add(Duration(seconds: _expires));
      startTokenTimer(timeExpires);
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = jsonEncode(
          {"token": _token, "expires": timeExpires.toIso8601String()});
      await prefs.setString('userData', userData);
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) {
    _authentication(email, password, 'login');
  }

  Future<void> logout() async {
    _token = '';
    _expires = 0;
    notifyListeners();
    stopTokenTimer();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final data = jsonDecode(prefs.getString('userData') ?? '');
    DateTime expires = DateTime.parse(data['expires']);
    startTokenTimer(expires);
    return true;
  }

  Future<void> checkTimeExpires() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString('userData');

      if (data != null && data.isNotEmpty) {
        final decodedData = jsonDecode(data);
        if (decodedData.containsKey('expires')) {
          DateTime expires = DateTime.parse(decodedData['expires']);
          if (DateTime.now().isAfter(expires)) {
            logout();
          }
        } else {
          print('Key "expires" not found in decoded data.');
        }
      } else {
        print('No data found in SharedPreferences.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void startTokenTimer(DateTime timeExpires) {
    var timeUntil = timeExpires.difference(DateTime.now());
    timer = Timer(timeUntil, checkTimeExpires);
  }

  void stopTokenTimer() {
    timer.cancel();
  }
}
