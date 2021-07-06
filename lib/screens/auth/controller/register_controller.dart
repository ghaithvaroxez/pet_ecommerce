import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/auth/model/contstants.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class RegisterController extends GetxController {
  var type = UserType.user;
  var showLoading = false;
  String address;
  String firstName;
  String lastName;
  String mainName;
  String phoneNumber;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  RegisterController() {
    address = address_list[0];
  }

  changeToOtp() {
    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
    update();
  }

  changeToRegister() {
    currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
    update();
  }

  changeLoading(bool loading) {
    showLoading = loading;
    update();
  }

  changeType(String customType) {
    // type=UserType.stable;
    switch (customType) {
      case "user":
        type = UserType.user;
        break;
      case "doctor":
        type = UserType.doctor;
        break;
      case "stable":
        type = UserType.stable;
        break;
      case "store":
        type = UserType.store;
        break;
    }

    update();
  }

  saveData(String add, String fn, String ln, String mn, String phone) {
    address = add;
    firstName = fn;
    lastName = ln;
    mainName = mn;
    phoneNumber = phone;
  }
}
