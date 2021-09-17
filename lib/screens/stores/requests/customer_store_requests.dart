import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/services/http_requests_service.dart';
import '../model/all_stores.dart';
import 'package:get/get.dart';
class CustomerStoreRequests extends HttpService{

Future<AllStores> getStores()async
{
  final apiResult=await getRequest(Api.allStores,includeHeaders: false);
  AllStores Stores;
  if(apiResult.statusCode==200)
    {
      Stores =allStoresFromJson(apiResult.data);
      return Stores;
    }
else Get.rawSnackbar(message:"Something is wrong",backgroundColor: Colors.redAccent);

}



}