import 'package:get/get.dart';
import 'package:pets_ecommerce/models/offer.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
class VendorOffersController extends GetxController{

  List<Offer> offers=[

  ];
  OffersScreenState _state=OffersScreenState.showOffers;


  addNewOffer(Offer offer)
  {
    offers.add(offer);
    update();
  }



  deleteOffer(Offer offer)
  {
    offers.remove(offer);
    update();
  }


  ///state_management
  get state=>_state;

  changeToViewOffers(){
    _state=OffersScreenState.showOffers;
    update();
  }

  changeToAddOffer(){
    _state=OffersScreenState.addOffer;
    update();
  }

  changeToEditOffer(){
    _state=OffersScreenState.editOffer;
    update();
  }



}

