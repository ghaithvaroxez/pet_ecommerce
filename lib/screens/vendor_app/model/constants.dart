import 'package:pets_ecommerce/screens/vendor_app/controller/products_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/offers_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/vendor_label_controller.dart';
VendorProductsController vendorProductsController=Get.put(VendorProductsController());
VendorOffersController vendorOfferController=Get.put(VendorOffersController());
TabController vendorAppTabController;
VendorLabelController vendorAppLabelController =
Get.put(VendorLabelController());