import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/home/model/home_model.dart';
import 'package:pets/screens/home/requests/home_requests.dart';

class HomeController extends GetxController {
  bool loading = false;
  bool error = false;

  HomeModel homeModel;
  HomeRequests homeRequests = HomeRequests();

  getHome() async {
    setLoading();
    error = false;

    try {
      homeModel = await homeRequests.getHome();
    } catch (e) {
      consolePrint(e.toString());
      removeLoading();
      error = true;
      update();
    }
    removeLoading();
    update();
  }

  setLoading() {
    loading = true;
    update();
  }

  removeLoading() {
    loading = false;
    update();
  }
}
