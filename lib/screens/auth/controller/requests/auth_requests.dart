import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/auth/controller/register_controller.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/main_screen/view/main_view.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
class AuthRequest extends HttpService {
  // Future<ApiResponse> resetPasswordRequest({
  //   @required String phone,
  //   @required String password,
  //   @required String firebaseToken,
  // }) async {
  //   final apiResult = await postRequest(
  //     Api.forgotPassword,
  //     {
  //       "phone": phone,
  //       "password": password,
  //       "firebase_id_token": firebaseToken,
  //     },
  //   );
  //
  //   return ApiResponse.fromResponse(apiResult);
  //
AuthRequest(){
  _auth.setSettings(appVerificationDisabledForTesting: true);
}
  FirebaseAuth _auth =FirebaseAuth.instance;
  String phoneVerificationId;
  Future<bool> registerUserRequest({
    @required String firstName,
    @required String secondName,
    @required String mobile,
    @required String password,
    @required int address,
  }) async {
    final apiResult = await postRequest(
      Api.registerUser,
      {
        "name": firstName,
        "last_name": secondName,
        "mobile": mobile,
        "password": password,
        "district_id": address,
      },
    );
    if (apiResult.statusCode == 200)
    // {
    //   UserModel userModel =
    //       await loginRequest(mobile: mobile, password: password);
    //   if (userModel.error == false) {
    //     AuthServices.saveUser(userModel.toJson());
    //     return true;
    //   } else
    //     return false;
    // }
      return true;
    else
      return false;
  }

  Future<bool> registerStoreRequest({
    @required String store_name,
    // @required String secondName,
    @required String mobile,
    @required String password,
    @required int address,
  }) async {
    final apiResult = await postRequest(
      Api.registerStore,
      {
        "store_name": store_name,
        // "last_name":secondName,
        "phone": mobile,
        "password": password,
        "district_id": address,
      },
    );
    if (apiResult.statusCode == 200)
    // {
    //   UserModel userModel =
    //       await loginRequest(mobile: mobile, password: password);
    //   if (userModel.error == false) {
    //     AuthServices.saveUser(userModel.toJson());
    //     return true;
    //   } else
    //     return false;
    // }
    //
      return true;
    else
      return false;
  }

  Future<bool> registerStableRequest({
    @required String stable_name,
    // @required String secondName,
    @required String mobile,
    @required String password,
    @required int address,
  }) async {
    final apiResult = await postRequest(
      Api.registerStable,
      {
        "store_name": stable_name,
        // "last_name":secondName,
        "phone": mobile,
        "password": password,
        "district_id": address,
      },
    );
    if (apiResult.statusCode == 200)
    // {
    //   UserModel userModel =
    //       await loginRequest(mobile: mobile, password: password);
    //   if (userModel.error == false) {
    //     AuthServices.saveUser(userModel.toJson());
    //     return true;
    //   } else
    //     return false;
    // }
    return true;
      else
      return false;
  }

  Future<bool> registerDoctorRequest({
    @required String firstName,
    @required String secondName,
    @required String mobile,
    @required String password,
    @required int address,
  }) async {
    final apiResult = await postRequest(
      Api.registerDoctor,
      {
        "first_name": firstName,
        "last_name": secondName,
        "mobile": mobile,
        "password": password,
        "district_id": address,
      },
    );

    if (apiResult.statusCode == 200)
    // {
    //   UserModel userModel =
    //       await loginRequest(mobile: mobile, password: password);
    //   if (userModel.error == false) {
    //     AuthServices.saveUser(userModel.toJson());
    //     return true;
    //   } else
    //     return false;
    // }
      return true;
    else
      return false;
  }

  Future<UserModel> loginRequest({
    @required String mobile,
    @required String password,
  }) async {
    if(mobile[0]=='+') {
      mobile = mobile.substring(1);
      mobile = "00" + mobile;
    }
    if(!(mobile[0]=='0'&&mobile[1]=='0'))
      {
        mobile = "00" + mobile;
      }
    consolePrint(mobile);
    final apiResult = await postRequest(
      Api.login,
      {
        "mobile": mobile,
        "password": password,
      },
    );
    consolePrint(apiResult.data["status"].toString());
    if (apiResult.statusCode == 200 &&
        apiResult.data["status"] != false
    ) {
consolePrint("saving user");
    AuthServices.saveUser(apiResult.data);
      return UserModel.fromJson(apiResult.data);
    }
    // else if(apiResult.statusCode == 200 ){ }
    else {
      UserModel error = UserModel();
      error.error = true;
      return error;
    }
  }

  Future<bool> login({
    @required String mobile,
    @required String password,
  })async
  {
    UserModel userModel =
    await loginRequest(mobile: mobile, password: password);
    if (userModel.error == false) {
      AuthServices.saveUser(userModel.toJson());
      return true;
    } else
      return false;
  }

  //
  Future<bool> logoutRequest() async {
    final apiResult = await getRequest(Api.logout);
    return false;
    // return ApiResponse.fromResponse(apiResult);
  }

//
// Future<ApiResponse> updateProfile({
//   File photo,
//   String name,
//   String email,
//   String phone,
// }) async {
//   final apiResult = await postWithFiles(
//     Api.updateProfile,
//     {
//       "_method": "PUT",
//       "name": name,
//       "email": email,
//       "phone": phone,
//       "photo": photo != null
//           ? await MultipartFile.fromFile(
//         photo.path,
//       )
//           : null,
//     },
//   );
//   return ApiResponse.fromResponse(apiResult);
// }
Future<bool> isExist(String mobile)async
{
  consolePrint(mobile);
  final apiResult = await postRequest(
    Api.mobileExist,
    {
      "mobile": mobile,
    },
  );

  if(apiResult.statusCode ==200)
    {
      consolePrint(apiResult.data['message']);
      if(apiResult.data['message']=="app.mobile does not  exist")
        return false;
      else return true;
    }
  else return true;
}

Future<bool> verifyPhoneNumber(String phone) async {
consolePrint(phone);
try{

  registerController.changeLoading(true);


  await _auth.verifyPhoneNumber(
    phoneNumber: phone,
    verificationCompleted: (phoneAuthCredential) async {
      registerController.changeLoading(false);
consolePrint("verify done");
// Get.to(MainScreen());
      registerController.changeToOtp();
      // setState(() {
      //   showLoading = false;
      // });
      //signInWithPhoneAuthCredential(phoneAuthCredential);
    },
    verificationFailed: (FirebaseAuthException verificationFailed) async {
      registerController.changeLoading(false);
      Get.snackbar("OOPS!!!", "verification failed:"+verificationFailed.message,duration: five_sec);

      consolePrint("verification failed:"+verificationFailed.message);
      // setState(() {
      //   showLoading = false;
      // });
      // _scaffoldKey.currentState.showSnackBar(
      //     SnackBar(content: Text(verificationFailed.message)));
    },
    codeSent: (verificationId, resendingToken) async {
      registerController.changeLoading(false);
      registerController.changeToOtp();
      // Get.to(MainScreen());
      phoneVerificationId=verificationId;
      consolePrint("code sent :\n verification id is"+verificationId);
      Get.snackbar("done", "we sent message to "+phone,duration: five_sec);
      // setState(() {
      //   showLoading = false;
      //   currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
      //   this.verificationId = verificationId;
      // });9
    },
    codeAutoRetrievalTimeout: (verificationId) async {},
  );
}on FirebaseAuthException catch (e) {
consolePrint("firebase exception"+e.message);
Get.snackbar("failed", e.message,duration: five_sec);

  // _scaffoldKey.currentState
  //     .showSnackBar(SnackBar(content: Text(e.message)));
}

}

Future<bool> reVerifyPhoneNumber(String phone) async {

try{
  registerController.changeLoading(true);


  await _auth.verifyPhoneNumber(
    phoneNumber: phone,
    verificationCompleted: (phoneAuthCredential) async {
      registerController.changeLoading(false);
      // registerController.changeState();
      // setState(() {
      //   showLoading = false;
      // });
      //signInWithPhoneAuthCredential(phoneAuthCredential);
    },
    verificationFailed: (verificationFailed) async {
      Get.snackbar("OOPS!!!", "verification failed:"+verificationFailed.message,duration: five_sec);
      registerController.changeLoading(false);
      registerController.changeToRegister();
      consolePrint("verification failed:"+verificationFailed.message);
      // setState(() {
      //   showLoading = false;
      // });
      // _scaffoldKey.currentState.showSnackBar(
      //     SnackBar(content: Text(verificationFailed.message)));
    },
    codeSent: (verificationId, [int forceResendingToken]) async {
      registerController.changeLoading(false);
      // registerController.changeState();
      phoneVerificationId=verificationId;
      consolePrint("code sent :\n verification id is"+verificationId);
      Get.snackbar("done", "we sent message to "+phone,duration: five_sec);
      // setState(() {
      //   showLoading = false;
      //   currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
      //   this.verificationId = verificationId;
      // });
    },
    codeAutoRetrievalTimeout: (verificationId) async {
      phoneVerificationId=verificationId;
    },
    timeout: Duration(seconds: 30),
  );
}catch (e) {
  registerController.changeLoading(false);
Get.snackbar("failed", e.message,duration: five_sec);

  // _scaffoldKey.currentState
  //     .showSnackBar(SnackBar(content: Text(e.message)));
}

}

  void signInWithPhoneAuthCredentialWithOtpCode(
      String otpCode) async {
    // setState(() {
    //   showLoading = true;
    // });

    try {
      registerController.changeLoading(true);
      AuthCredential credential =
      PhoneAuthProvider.credential(
          verificationId: phoneVerificationId, smsCode: otpCode);

      final authCredential =
      await _auth.signInWithCredential(credential);

      // setState(() {
      //   showLoading = false;
      // });

      if(authCredential.user != null){

        consolePrint("phone verified successfully");
        // Get.snackbar("Success", "Donnnnnnnnnnnnnnnnnnnnnnnnnnnnne!",duration: five_sec);
bool k=await register2();
        registerController.changeLoading(false);
        consolePrint("backeend register "+k.toString());

        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else {
        registerController.changeLoading(false);
        // registerController.changeToRegister();
        Get.snackbar("Failed", "You have entered wrong code try again ",
            duration: five_sec);
      };

    } on FirebaseAuthException catch (e) {
      // setState(() {
      //   showLoading = false;
      // });
      registerController.changeLoading(false);
      registerController.changeToRegister();
      Get.snackbar("failed", e.message,duration: five_sec);
      // _scaffoldKey.currentState
      //     .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }


}
