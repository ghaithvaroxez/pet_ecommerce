import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/home/model/home_model.dart';
import 'package:pets_ecommerce/screens/status/model/status_model.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';

class HomeRequests extends HttpService{
  UserModel user ;
  getmodel()async{
    user = await AuthServices.getCurrentUser();
  }



  Future<List<StatusAll>> getAllStatuses() async
  {
    List<StatusAll> status=[];

      final apiResult = await getRequest(
        Api.allStatuses ,
        queryParameters: null,
        includeHeaders: true,
      );
      if(apiResult.statusCode==200)
      status= List<StatusAll>.from(apiResult.data['status_all'].map((x) => StatusAll.fromJson(x)));
    return status;
  }

  Future<HomeModel> getHome() async
  {
    HomeModel homeModel;

      final apiResult = await getRequest(
        Api.home ,
        queryParameters: null,
        includeHeaders: true,
      );
      if(apiResult.statusCode==200)
      homeModel= HomeModel.fromJson(apiResult.data);
    return homeModel;
  }

}