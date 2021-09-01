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
class VendorAppProductsReq extends HttpService {
  UserModel vendor ;
getmodel()async{
  vendor = await AuthServices.getCurrentUser();
}
  // VendorAppProductsReq(){
  //    getmodel();
  // }

  Future<List<StoreProduct>> getStoreProducts() async
  {
    consolePrint("get all products for store");
    final apiResult = await getRequest(
   "/store/products/all" + '/' + vendor.store[0].id.toString(),
      queryParameters: null,
    );
    consolePrint("befor convert data");
    var list=  List<StoreProduct>.from(apiResult.data["store"]["store_products"].map((x) => StoreProduct.fromJson(x)));
   consolePrint("after convert data");
consolePrint(apiResult.data.toString());
consolePrint(list.toString());
return list;
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }

  Future<bool> changeProductStatus(int productId) async {

    FormData formData =
    new FormData.fromMap({
      "product_id":productId,

    });

    try {
      final apiResult = await postRequest(
          Api.changeProductStatus, formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
       {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
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

  Future<bool> updateProduct
      ({
   @required int category_id,
    @required int type_id,
    @required String name_ar,
    @required String name_en,
    @required String body_ar,
    @required String body_en,
    @required String image,
    @required String price,

    @required int product_id,
  })
  async {
    FormData formData =
    new FormData.fromMap({
       "category_id":category_id,
       "type_id":type_id,
       "name_ar":name_ar,
       "name_en":name_en,
       "body_ar":body_ar,
       "body_en":body_en,
      "price":price,
       "image":image,
      "store_id":vendor.store[0].id.toString()
    });

    try {
      final apiResult = await postRequest(
          Api.updateProduct+"/"+product_id.toString(), formData,
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


Future<bool> AddProduct({
  @required int category_id,
  @required int type_id,
  @required String name_ar,
  @required String name_en,
  @required String body_ar,
  @required String body_en,
  @required String image,
  @required String price,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      "category_id":category_id,
      "type_id":type_id,
      "name_ar":name_ar,
      "name_en":name_en,
      "body_ar":body_ar,
      "body_en":body_en,
      "image":image,
      "price":price,
      "store_id": vendor.store[0].id
    });

    try {
      final apiResult = await postRequest(
          Api.addProduct, formData,
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

Future<bool> deleteProduct({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    int productId,
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
          Api.deleteProduct+"/"+productId.toString(), formData,
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

Future<bool> disUploadProduct({
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

Future<bool> uploadProduct({
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