import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderProvider extends ChangeNotifier {
  Future<void> getSlider() async {
    final url = 'http://apiforlearning.zendvn.com/api/mobile/sliders';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    print(jsonData);
  }
}
