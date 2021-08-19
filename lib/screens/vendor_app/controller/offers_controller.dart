import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/categories.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/types.dart';
import 'package:pets_ecommerce/screens/vendor_app/requests/offers_requests.dart';
import 'package:pets_ecommerce/screens/vendor_app/requests/products_requests.dart';
import '../model/offer.dart';
class VendorOffersController extends GetxController{

  List<Offer> offers=[

  ];
  List<Category> vendor_category_items = [

  ];
  List<ProductType> vendor_type_items = [

  ];

  VendorAppOffersReq vendorAppOffersReq=VendorAppOffersReq();
  bool loading=false;
  getOffer()async {
    offers=await vendorAppOffersReq.getStoreOffers();
    update();
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }
  init()async{
    vendor_category_items=await vendorAppOffersReq.getStoreCategories();
    vendor_type_items=await vendorAppOffersReq.getStoreTypes();
    await vendorAppOffersReq.getmodel();
    await  getOffer();
  }
  changeStatus(int offerId)async{
    activeLoading();

    try{
      bool k = await vendorAppOffersReq.changeOfferStatus(

          offerId);
      if (k == true) {

        await getOffer();
        await homeController.getHome();
        removeLoading();
        update();
      }
      else
        {
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't change product status now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e){

      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't change product status now try again later",
          backgroundColor: Colors.redAccent);

    }
  }
  addNewOffer(
      {@required int category_id,
        @required int type_id,
        @required String name_ar,
        @required String name_en,
        @required String desc_ar,
        @required String desc_en,
        @required String image,
     })async
  {

    activeLoading();

    try{
      bool k = await vendorAppOffersReq.AddOffer(
          category_id: category_id,
          type_id: type_id,
          name_ar: name_ar,
          name_en: name_en,
          desc_ar: desc_ar,
          desc_en: desc_en,
          image: image,
         );
      if (k == true) {
        await getOffer();
        await homeController.getHome();
        Get.back();
        removeLoading();
      } else {
        Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your offer now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e)
    {
      Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your offer now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();

  }

  deleteOffer(Offer offer)
  async {
    activeLoading();

    try{
      bool k = await vendorAppOffersReq.deleteOffer(
        // category_id: product.categoryId,
        // type_id: product.typeId,
        // name_ar: product.name,
        // name_en: product.name,
        // body_ar: product.body,
        // body_en: product.body,
        // image: product.image,
          offerId: offer.id);
      if (k == true) {
        await getOffer();
        await homeController.getHome();
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


  editOffer(Offer offer,String newImage)
  async {
    activeLoading();
int category_id;
int type_id;
for(int i=0;i<vendor_category_items.length;i++)
  {
    if(vendor_category_items[i].name==offer.category)
      category_id=vendor_category_items[i].id;
  }
for(int i=0;i<vendor_type_items.length;i++)
  {
    if(vendor_type_items[i].name==offer.type)
      type_id=vendor_type_items[i].id;
  }
    try{
      bool k = await vendorAppOffersReq.updateOffer(
        category_id: category_id,
        type_id: type_id,
        name_en: offer.name,
        name_ar: offer.name,
        desc_ar: offer.desc,
        desc_en: offer.desc,
        offer_id: offer.id,
        image: newImage == "" ? null : newImage,
      );
      if (k == true) {
        await getOffer();
        await homeController.getHome();
        Get.back();
        removeLoading();
        update();
      } else {
        Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't edit your offer now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e){

      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't edit your offer now try again later",
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

