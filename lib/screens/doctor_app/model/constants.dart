import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/doctor_label_controller.dart';
import '../controller/doctor_services_controller.dart';



TabController doctorAppTabController;
DoctorLabelController customDoctorLabelController=Get.put(DoctorLabelController());
DoctorServicesController customDoctorServicesController=Get.put(DoctorServicesController());