import 'dart:math';

import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/doctors/model/all_doctors.dart';
import '../requsts/search_requests.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/screens/stores/model/custoer_store_offer.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:pets/services/http_requests_service.dart';
import 'translations/search_controller.i18n.dart';

class SearchController extends GetxController {
  bool loading = false;
  bool error = false;
  SearchRequests searchRequests = SearchRequests();
  List<Offer> offers = [];
  List<StoreProduct> products = [];
  List<Store> stores = [];
  List<Store> sieves = [];
  List<Store> barns = [];
  List<Doctor> doctors = [];
  List<Category> categories = [];

  clearLists() {
    offers = [];
    products = [];
    stores = [];
    sieves = [];
    barns = [];
    doctors = [];
    categories = [];
    update();
  }

  searchGeneral(String name) async {
    try {
      removeError();
      activeLoading();

      var j = await searchRequests.searchAll(name);
      if (j == false) {
        Get.rawSnackbar(message: "الرجاء المجاولة مجدداً".i18n);
        removeLoading();
        activeError();
      } else {
        products.clear();
        offers.clear();
        stores.clear();
        doctors.clear();
        products = List<StoreProduct>.from(
            j["items"].map((x) => StoreProduct.fromJson(x)));
        offers = List<Offer>.from(j["offers"].map((x) => Offer.fromJson(x)));
        var temp = List<Store>.from(j["stores"].map((x) => Store.fromJson(x)));
        for (int i = 0; i < temp.length; i++) {
          if (temp[i].type == "store")
            stores.add(temp[i]);
          else if (temp[i].type == "barn")
            barns.add(temp[i]);
          else if (temp[i].type == "sieve") sieves.add(temp[i]);
        }

        doctors =
            List<Doctor>.from(j["doctors"].map((x) => Doctor.fromJson(x)));
        categories = List<Category>.from(
            j["categories"].map((x) => Category.fromJson(x)));

        removeLoading();
      }
    } catch (e) {
      Get.rawSnackbar(message: "الرجاء المجاولة مجدداً".i18n);
      removeLoading();
      activeError();
      consolePrint("General Search Error" + e.toString());
    }
  }

  searchOffer(String offerName, {int catId = -1, int typeId = -1}) async {
    offers.clear();
    removeError();
    activeLoading();

    try {
      offers = await searchRequests.getOffers(offerName,
          catId: catId, typeId: typeId);
      if (offers.length != 0) if (offers[0].error) {
        activeError();
      }
      removeLoading();
      update();
    } catch (e) {
      consolePrint("searchOffers Error:" + e.toString());
      activeError();
      removeLoading();
      update();
    }
  }

  searchProducts(String productName,
      {int catId = -1,
      int typeId = -1,
      double price1 = -1,
      double price2 = -1}) async {
    products.clear();
    removeError();
    activeLoading();
// var max,min;
// max=max(price1, price2);
// min=min(price1,price2);
    // try{
    products = await searchRequests.getProducts(productName,
        catId: catId, typeId: typeId, price1: price1, price2: price2);
    consolePrint(products.toString());
    if (products.length != 0) if (products[0].error) {
      activeError();
    }
    removeLoading();
    update();
    // }catch(e){
    //   consolePrint("searchProducts Error:"+e.toString());
    //   activeError();
    //   removeLoading();
    //   update();
    // }
  }

  searchStores(String storeName,
      {int district = -1,
      bool store = false,
      bool barn = false,
      bool sieve = false}) async {
    stores.clear();
    removeError();
    activeLoading();

    try {
      stores = await searchRequests.getStores(storeName,
          district: district, store: store, barn: barn, sieve: sieve);
      if (stores.length != 0) if (stores[0].error) {
        activeError();
      }
      removeLoading();
      update();
    } catch (e) {
      consolePrint("searchStores Error:" + e.toString());
      activeError();
      removeLoading();
      update();
    }
  }

  searchDoctors(String doctorName, {int district = -1}) async {
    stores.clear();
    removeError();
    activeLoading();

    try {
      doctors = await searchRequests.getDoctors(doctorName, district: district);
      if (doctors.length != 0) if (doctors[0].error) {
        activeError();
      }
      removeLoading();
      update();
    } catch (e) {
      consolePrint("searchStores Error:" + e.toString());
      activeError();
      removeLoading();
      update();
    }
  }

  searchCategories(String categoryName) async {
    categories.clear();
    removeError();
    activeLoading();

    try {
      categories = await searchRequests.getCat(
        categoryName,
      );
      if (categories.length != 0) if (categories[0].error) {
        activeError();
      }
      removeLoading();
      update();
    } catch (e) {
      consolePrint("searchCategories Error:" + e.toString());
      activeError();
      removeLoading();
      update();
    }
  }

  activeLoading() {
    loading = true;
    update();
  }

  removeLoading() {
    loading = false;
    update();
  }

  activeError() {
    error = true;
    update();
  }

  removeError() {
    error = false;
    update();
  }
}
