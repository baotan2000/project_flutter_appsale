import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_appsale/page/home/widget/slider_model.dart';

class SliderProvider extends ChangeNotifier {
  Future<List<Sli>> getSlider() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/sliders';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    print(jsonData);
    List<Sli> data = List<Sli>.from(
        jsonData.map((slider) => Sli.fromJson(jsonEncode(slider)))).toList();
    return data;
  }
}
