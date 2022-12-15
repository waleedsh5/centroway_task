import 'package:dio/dio.dart';

import '../DioHelper.dart';

class HomeController {
  static Future<Response> getHomeData() {
    return DioHelper().get('omartawashiC/demo/master/db.json');
  }
  
}
