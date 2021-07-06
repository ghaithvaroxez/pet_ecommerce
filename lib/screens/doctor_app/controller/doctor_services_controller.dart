import 'dart:developer';

import 'package:get/get.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import '../model/service.dart';
class DoctorServicesController extends GetxController{

  List<Service> services=[

  ];
  ServicesScreenState _state=ServicesScreenState.showServices;


  addNewService(Service service)
  {
    services.add(service);
    update();

  }

  deleteService(Service service)
  {
    services.remove(service);
    update();
  }


  ///state_management
  get state=>_state;

  changeToViewServices(){
    _state=ServicesScreenState.showServices;
    update();
  }

  changeToAddService(){
    _state=ServicesScreenState.addService;
    update();
  }

  changeToEditService(){
    _state=ServicesScreenState.editService;
    update();
  }



}

enum ServicesScreenState{
  addService,
  showServices,
  editService
}