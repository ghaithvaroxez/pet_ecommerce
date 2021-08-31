import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/corner/model/corner_model.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'package:pets_ecommerce/screens/orders/model/all_orders_model.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import 'package:dio/dio.dart';

class MyOrdersRequests extends HttpService {
  UserModel vendor;

  getmodel() async {
    vendor = await AuthServices.getCurrentUser();
  }

  Future<Order> getOrderId(int id) async {
    Order order;
      final apiResult = await getRequest(
        Api.getOrderId+"/"+id.toString(),
        queryParameters: null,
        includeHeaders: true,
      );
      order = Order.fromJson(apiResult.data);


    return order;
  }

Future<List<Order>> getMyOrders() async {
    OrdersModel ordersModel;

      final apiResult = await getRequest(
        Api.myOrders,
        queryParameters: null,
        includeHeaders: true,
      );
      ordersModel = OrdersModel.fromJson(apiResult.data);


    return ordersModel.orders;
  }

  Future<List<Order>> getMyAnsweredOrders() async {
    OrdersModel ordersModel;

      final apiResult = await getRequest(
        Api.myAnswers,
        queryParameters: null,
        includeHeaders: true,
      );
      ordersModel = OrdersModel.fromJson(apiResult.data);


    return ordersModel.orders;
  }

  Future<bool> addAnswer(
      @required String answer,
     ) async {
    FormData formData;
    if (vendor.store.length == 1) {
      formData = new FormData.fromMap({
        "answer": answer,
        "store_id":vendor.store[0].id
      });

    }
    else{

      formData = new FormData.fromMap({
        "answer": answer,
      });
    }
      try {
        final apiResult =
            await postRequest(Api.addOrderAnswer, formData, includeHeaders: true);
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        consolePrint(e.toString());
        return false;
      }

  }

  Future<bool> addOrder(
      @required String orderImage,
      @required String name,
      @required String desc,
      @required int cat_id,
      @required int type_id,
      @required String order_type,
      @required double price) async {

      FormData formData = new FormData.fromMap({
        "category_id": cat_id,
        "type_id": type_id,
        "order_type": order_type,
        "question": desc,
        "image": orderImage,
        "price": price,
        "title": name,
});

      try {
        final apiResult =
            await postRequest(Api.addOrder, formData, includeHeaders: true);
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        consolePrint(e.toString());
        return false;
      }

  }
  Future<bool> updateOrder(
      @required int oreder_id,
      {@required String orderImage,
      @required String name,
      @required String desc,
      @required int cat_id,
      @required int type_id,
      @required String order_type,
      @required int price}) async {

      FormData formData = new FormData.fromMap({
        "category_id": cat_id,
        "type_id": type_id,
        "order_type": order_type,
        "question": desc,
        "image": orderImage,
        "price": price,
        "title": name,
});

      try {
        final apiResult =
            await postRequest(Api.updateOrderId+"/"+oreder_id.toString(), formData, includeHeaders: true);
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        consolePrint(e.toString());
        return false;
      }

  }

  Future<bool> deleteOrder(int id) async {
    FormData formData = new FormData.fromMap({
      // "images_id":id,
    });

    try {
      final apiResult = await getRequest(
          Api.deleteOrderId + "/" + id.toString(), //formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }


  //
  // Future<bool> editCornerName(@required String name,int id) async
  // {
  //   if(vendor.store.length==1)
  //   {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "name":name,
  //       "store_id": vendor.store[0].id.toString(),
  //     });
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       return false;
  //     }
  //   }
  //   else {
  //     FormData formData =
  //     new FormData.fromMap({
  //
  //       "name":name,
  //     });
  //
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       consolePrint(e.toString());
  //       return false;
  //     }
  //   }
  //
  // }
  //
  // Future<bool> editCornerDesc(@required String desc,int id) async
  // {
  //   if(vendor.store.length==1)
  //   {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "desc":desc,
  //       "store_id": vendor.store[0].id.toString(),
  //     });
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       return false;
  //     }
  //   }
  //   else {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "desc":desc,
  //     });
  //
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       consolePrint(e.toString());
  //       return false;
  //     }
  //   }
  //
  // }
  //
  // Future<bool> addSubPhoto(String image, int id) async {
  //   FormData formData = new FormData.fromMap({
  //     "images_count": "1",
  //     "image0": image,
  //   });
  //   consolePrint("corner image : $image");
  //   try {
  //     final apiResult = await postRequest(
  //         Api.addPhoto + "?corner_id=" + id.toString(), formData,
  //         includeHeaders: true);
  //     if (apiResult.statusCode == 200) {
  //       return true;
  //     } else
  //       return false;
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  // Future<bool> subPhotoToStory(int id) async {
  //   consolePrint("transfer image " + id.toString());
  //   FormData formData;
  //   if (vendor.store.length == 1) {
  //     formData = new FormData.fromMap({
  //       // "images_count":"1",
  //       "store_id": vendor.store[0].id.toString(),
  //     });
  //   } else {
  //     formData = new FormData.fromMap({
  //       // "images_count":"1",
  //       // "image0":image,
  //     });
  //   }
  //
  //   // consolePrint("corner image : $image");
  //   try {
  //     final apiResult = await postRequest(
  //         Api.convertPhotoToStory + "/" + id.toString(), formData,
  //         includeHeaders: true);
  //     consolePrint(apiResult.statusCode.toString());
  //     if (apiResult.statusCode == 200) {
  //       await statusController.init();
  //       return true;
  //     } else
  //       return false;
  //   } catch (e) {
  //     consolePrint(e.toString());
  //     return false;
  //   }
  // }
  //
  // Future<bool> deleteSubPhoto(int id) async {
  //   FormData formData = new FormData.fromMap({
  //     // "images_id":id,
  //   });
  //
  //   try {
  //     final apiResult = await postRequest(
  //         Api.removePhoto + "/" + id.toString(), formData,
  //         includeHeaders: true);
  //     if (apiResult.statusCode == 200) {
  //       return true;
  //     } else
  //       return false;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
