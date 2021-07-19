import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import '../model/product.dart';
import 'package:dio/dio.dart';
import '../model/categories.dart';
import '../model/types.dart';
import '../model/offer.dart';
class VendorAppOffersReq extends HttpService {
  UserModel vendor ;
  getmodel()async{
    vendor = await AuthServices.getCurrentUser();
  }
  // VendorAppProductsReq(){
  //    getmodel();
  // }

  Future<List<Offer>> getStoreOffers() async
  {
    final apiResult = await getRequest(
      Api.getStoreOffers + '/' + vendor.store[0].id.toString(),
      queryParameters: null,
    );
    return  List<Offer>.from(apiResult.data["offers"].map((x) => Offer.fromJson(x)));
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }

  Future<List<Category>> getStoreCategories() async
  {

    final apiResult = await getRequest(
      Api.categories,
      queryParameters: null,
    );

    return  List<Category>.from(apiResult.data["categories"].map((x) => Category.fromJson(x)));
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);

    // return storeModel.store;
  }

  Future<List<ProductType>> getStoreTypes() async
  {

    final apiResult = await getRequest(
      Api.types,
      queryParameters: null,
    );
    // consolePrint(apiResult.data.toString());
    // Types t=  typesFromJson(apiResult.data["product_types"]);
    return List<ProductType>.from(apiResult.data["product_types"].map((x) => ProductType.fromJson(x)));
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }

  Future<bool> updateOffer
      ({
    @required int category_id,
    @required int type_id,
    @required String name_ar,
    @required String name_en,
    @required String desc_ar,
    @required String desc_en,
    @required String image,
    @required int offer_id,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      "category_id":category_id,
      "type_id":type_id,
      "name_ar":name_ar,
      "name_en":name_en,
      "desc_ar":desc_ar,
      "desc_en":desc_en,
      "image":image,
      "store_id":vendor.store[0].id.toString()
    });

    try {
      final apiResult = await postRequest(
          Api.updateOffer+"/"+offer_id.toString(), formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)

        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }


  Future<bool> AddOffer({
    @required int category_id,
    @required int type_id,
    @required String name_ar,
    @required String name_en,
    @required String desc_ar,
    @required String desc_en,
    @required String image,
  })
  async {
    consolePrint(      "category_id"+category_id.toString());
    consolePrint(      "type_id"+type_id.toString());
    consolePrint(      "desc_ar"+desc_ar.toString());
    consolePrint(      "desc_en"+desc_en.toString());
    consolePrint(      "image"+image.toString());
    consolePrint(      "store_id"+vendor.store[0].id.toString());
    consolePrint(      await AuthServices.getAuthToken());
    FormData formData =
    new FormData.fromMap({
      "category_id":category_id,
      "type_id":type_id,
      "name_ar":name_ar,
      "name_en":name_en,
      "desc_ar":desc_ar,
      "desc_en":desc_en,
      // "image":"blabla",
      "image":image,
      "store_id": vendor.store[0].id
    });
/*
* eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjMxMGQ4MTkyMjA4OTllYmYwODY3OGE3NWIyN2JlZGVkNDIzMmIxNTQ3N2MwMWUwMWQyYWM1NjYwZDA1NTcyMmNlMTQ1MGZhYzJiOGJlZmI3In0
* */
    try {
      final apiResult = await postRequest(
          Api.addOffer, formData,
          includeHeaders: true);
     consolePrint( apiResult.data["message"].toString());
     consolePrint( "status code"+apiResult.statusCode.toString());
      if (apiResult.statusCode == 200)
        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      consolePrint(e.toString());
      return false;
    }
  }

  Future<bool> deleteOffer({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    int offerId,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // img!=null??  "image":
      // await MultipartFile.fromFile(img),
      // email!=null?? "email":email,
      // "district_id": address,
    });

    try {
      final apiResult = await postRequest(
          Api.deleteOffer+"/"+offerId.toString(), formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> disUploadOffer({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    int address,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // img!=null??  "image":
      // await MultipartFile.fromFile(img),
      // email!=null?? "email":email,
      // "district_id": address,
    });

    try {
      final apiResult = await postRequest(
          Api.updateStore, formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
        if (apiResult.data["status"] == true) {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> uploadOffer({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    int address,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // img!=null??  "image":
      // await MultipartFile.fromFile(img),
      // email!=null?? "email":email,
      // "district_id": address,
    });

    try {
      final apiResult = await postRequest(
          Api.updateStore, formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
        if (apiResult.data["status"] == true) {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }

}