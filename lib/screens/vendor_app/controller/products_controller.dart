import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:pets_ecommerce/screens/vendor_app/requests/products_requests.dart';
class VendorProductsController extends GetxController{

  List<StoreProduct> products=[

  ];
  VendorAppProductsReq vendorAppProductsReq=VendorAppProductsReq();
  bool loading=false;
  getProducts()async {
    products=await vendorAppProductsReq.getStoreProducts();
update();
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
 init();
  }
  init()async{
    await vendorAppProductsReq.getmodel();
    await  getProducts();
  }
  addNewProduct(
      {@required int category_id,
      @required int type_id,
      @required String name_ar,
      @required String name_en,
      @required String body_ar,
      @required String body_en,
      @required String image,
      @required String price})async
  {
  activeLoading();

  try{
      bool k = await vendorAppProductsReq.AddProduct(
          category_id: category_id,
          type_id: type_id,
          name_ar: name_ar,
          name_en: name_en,
          body_ar: body_ar,
          body_en: body_en,
          image: image,
          price: price);
      if (k == true) {
        await getProducts();
        Get.back();
        removeLoading();
      } else {
        Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your product now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e)
    {
      Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your product now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();

  }

deleteProduct(StoreProduct product)
async {
  activeLoading();

  try{
      bool k = await vendorAppProductsReq.deleteProduct(
          // category_id: product.categoryId,
          // type_id: product.typeId,
          // name_ar: product.name,
          // name_en: product.name,
          // body_ar: product.body,
          // body_en: product.body,
          // image: product.image,
          productId: product.id);
      if (k == true) {
        await getProducts();
        Get.back();
        removeLoading();
        update();
      } else {
        Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't delete your product now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e){
    Get.back();
    removeLoading();
    update();
    Get.rawSnackbar(
        message: "can't delete your product now try again later",
        backgroundColor: Colors.redAccent);
  }
  }


editProduct(StoreProduct product,String newImage)
async {
  activeLoading();

  try{
      bool k = await vendorAppProductsReq.updateProduct(
        category_id: product.categoryId,
        type_id: product.typeId,
        name_ar: product.name,
        name_en: product.name,
        body_ar: product.body,
        body_en: product.body,
        product_id: product.id,
        price: product.price,
        image: newImage == "" ? null : newImage,
      );
      if (k == true) {
        await getProducts();
        Get.back();
        removeLoading();
        update();
      } else {
        Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't edit your product now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e){

    Get.back();
    removeLoading();
    update();
    Get.rawSnackbar(
        message: "can't edit your product now try again later",
        backgroundColor: Colors.redAccent);

  }
  }



///state_management

activeLoading(){
    loading=true;
    update();
}
removeLoading(){
    loading=false;
    update();
}



}

