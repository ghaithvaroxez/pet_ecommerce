import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/status/model/status_model.dart';
import '../requests/home_requests.dart';
class StatusController extends GetxController
{
  List<StatusAll> status=[];
  bool loading =false;
  HomeRequests homeRequests=HomeRequests();

  getStatus()async{
   status=await homeRequests.getAllStatuses();
  }



  activeLoading(){
    loading=true;
    update();

  }


  removeLoading(){
    loading=false ;
    update();
  }


  init()async{
     activeLoading();
     try{


       await getStatus();

       removeLoading();
     }catch(e){
       consolePrint("home error"+e.toString());
       removeLoading();

     }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }
}