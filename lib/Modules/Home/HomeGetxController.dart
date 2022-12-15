import 'package:centroway_task/Api/Repo/HomeRepo.dart';
import 'package:centroway_task/Models/THome.dart';
import 'package:get/get.dart';

class HomeGetxController extends GetxController {
  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }

  bool isLoadingRequest = false;

  THome? homeData;
  getHomeData() async {
    isLoadingRequest = true;
    update();
    homeData = await HomeRepo().getHomeData();
    isLoadingRequest = false;
    update();
    return homeData;
  }
}
