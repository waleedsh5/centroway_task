import 'dart:convert';

import 'package:centroway_task/Api/Controlers/HomeController.dart';
import 'package:centroway_task/Models/THome.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Future<THome> getHomeData() async {
    THome? homedata;
    Response response = await HomeController.getHomeData();

    homedata = THome.fromJson(jsonDecode(response.data));
    print(homedata);
    return homedata;
  }
}
