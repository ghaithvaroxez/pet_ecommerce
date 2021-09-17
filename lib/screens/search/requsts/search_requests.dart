
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/screens/stores/model/custoer_store_offer.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:pets/screens/doctors/model/all_doctors.dart';
class SearchRequests extends HttpService{


  Future searchAll(String name)async{
    try{
      final apiResult = await getRequest(Api.generalSearch + name);
      if (apiResult.statusCode == 200) {
        return apiResult.data;
      } else
        return false;
    }catch(e){
      consolePrint("general search req error"+e.toString());
      return false;
    }
  }

Future<List<Offer>>getOffers(String offerName,{int catId=-1, int typeId=-1})async
{

  String mainUrl="${Api.searchOffers}$offerName";
if(catId!=-1)
  {
    mainUrl+="&category_id=$catId";
  }
if(typeId!=-1)
  {
    mainUrl+="&type_id=$typeId";
  }
  final apiResult=await getRequest(mainUrl);
if(apiResult.statusCode==200)
  {
    return  List<Offer>.from(apiResult.data["items"].map((x) => Offer.fromJson(x)));
}
else return [Offer(error: true)];
}

Future<List<StoreProduct>>getProducts(String productName,{int catId=-1,int typeId=-1,double price1=-1,double price2=-1})async
{
consolePrint("price1:$price1");
consolePrint("price2:$price2");
  String mainUrl="${Api.searchProducts}$productName";
  if(catId!=-1)
  {
    mainUrl+="&category_id=$catId";
  }
  if(typeId!=-1)
  {
    mainUrl+="&type_id=$typeId";
  }
  if(price1!=-1)
  {
    mainUrl+="&price1=${price1.floor()}";
  }
  if(price2!=-1)
  {
    mainUrl+="&price2=${price2.floor()}";
  }
  final apiResult=await getRequest(mainUrl);
  if(apiResult.statusCode==200)
  {
    return  List<StoreProduct>.from(apiResult.data["items"].map((x) => StoreProduct.fromJson(x)));
  }
  else return [StoreProduct(error: true)];
}

Future<List<Store>>getStores(String storeName,{int district=-1, bool store=false, bool barn=false, bool sieve=false})async
{

  String mainUrl="${Api.searchStores}$storeName";
  if(district!=-1)
  {
    mainUrl+="&district_id=$district";
  }
  if(store!=false)
  {
    mainUrl+="&store=store";
  }
  if(barn!=false)
  {
    mainUrl+="&barn=barn";
  }
  if(sieve!=false)
  {
    mainUrl+="&sieve=sieve";
  }
  final apiResult=await getRequest(mainUrl);
  if(apiResult.statusCode==200)
  {
    return  List<Store>.from(apiResult.data["items"].map((x) => Store.fromJson(x)));
  }
  else return [Store(error: true)];
}
Future<List<Doctor>>getDoctors(String doctorName,{int district=-1,})async
{

  String mainUrl="${Api.searchDoctors}$doctorName";
  if(district!=-1)
  {
    mainUrl+="&district_id=$district";
  }
  final apiResult=await getRequest(mainUrl);
  if(apiResult.statusCode==200)
  {
    return  List<Doctor>.from(apiResult.data["items"].map((x) => Doctor.fromJson(x)));
  }
  else return [Doctor(error: true)];
}

Future<List<Category>>getCat(String catName,)async
{
if(catName=="")return[];
  String mainUrl="${Api.searchCategory}$catName";
  final apiResult=await getRequest(mainUrl);
  if(apiResult.statusCode==200)
  {
    return  List<Category>.from(apiResult.data["items"].map((x) => Category.fromJson(x)));
  }
  else return [Category(error: true)];
}

}