import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import '../model/all_orders_model.dart';
import 'package:http/http.dart' as http;
class OrdersController extends GetxController{
  bool loading=false;
  bool error=false;

  OrdersModel ordersModel;

  fetchData()async{
   removeError();
   setLoading();
    try{

      var url=Uri.parse("${Api.baseUrl}/show/orders");
      consolePrint("before print");
      final h=await HttpService().getHeaders();
      final apiResult=await http.get(url,headers: h);
      consolePrint("after print");
      consolePrint("statusCode:"+apiResult.statusCode.toString());
      if(apiResult.statusCode==200)
      {
        ordersModel =ordersModelFromJson(apiResult.body);
      }
      else {
      setError();
      }

    }catch(e){
     setError();
      consolePrint(e.toString());
     removeLoading();

    }



    removeLoading();

  }


  setError(){
    error=true;
    update();

  }

  removeError(){
    error=false;
    update();
  }
  setLoading(){
    loading=true;
    update();

  }

  removeLoading(){
    loading=false;
    update();
  }
}