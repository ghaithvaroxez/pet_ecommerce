import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/categories/view/components/category_card.dart';
import 'package:pets/screens/home/view/components/doctor_card.dart';
import 'package:pets/screens/home/view/components/offer_card.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';
import 'package:pets/screens/home/view/components/selected_product_card.dart';
import 'package:pets/screens/home/view/components/store_and_stable_card.dart';
import 'package:pets/screens/home/view/home_view.dart';
import 'package:pets/screens/search/controller/search_controller.dart';
import 'package:get/get.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/location_model.dart';
import 'package:pets/screens/vendor_app/model/types.dart';
import 'package:pets/screens/vendor_app/requests/products_requests.dart';
import 'package:pets/screens/vendor_app/requests/vendor_app_requests.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../loading_screen.dart';
import 'components/filter_custom_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  SearchController searchController = Get.put(SearchController());
  TextEditingController textSearchController = TextEditingController();

  VendorAppProductsReq _vendorAppProductsReq = VendorAppProductsReq();
  VendorAppRequests _vendorAppRequests = VendorAppRequests();

  List<ProductType> vendor_type_items = [];

  List<Category> vendor_category_items = [];
  List<String> search_types = [
    "عام",
    "منتجات",
    "عروض",
    "متاجر",
    "اسطبلات",
    "مناحل",
    "اطباء",
    "أصناف",
  ];
  List<City> addresses = [];

  int selected_search_type = 0;
  int temp_selected_search_type =0;

  String selected_category_name = "";
  int selected_category_id = -1;

  int selected_type_id = -1;
  String selected_type_name = "";

  int selected_city_id = -1;
  String selected_city_name = "";

  bool isloading = false;
  bool serachError = false;

  var filter = false.obs;
  var search = false.obs;

  double minPrice=0;
  double maxPrice=1000;


  // double c_height=max_height;
  double max_height=getProportionateScreenHeight(550);
  double min_height=0;
  fetchdata() async {
    setState(() {
      isloading = true;
    });
    try {
      consolePrint("before get loccations");
      LocationModel locationModel = await _vendorAppRequests.getLocations();

      addresses = locationModel.cities;
      consolePrint("after get loccations");
      consolePrint("before get types");

      vendor_type_items = await _vendorAppProductsReq.getStoreTypes();
      consolePrint("after get types");
      consolePrint("before get categories");
      vendor_category_items = await _vendorAppProductsReq.getStoreCategories();
      consolePrint("after get categories");

    } catch (e) {
      serachError = true;
      setState(() {
        isloading = false;
      });
      consolePrint("search Screen" + e.toString());
    }

    setState(() {
      isloading = false;
    });
  }


  Future _buildBottomSheet(BuildContext context,Function refresh) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return  StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Directionality(
                 textDirection: TextDirection.rtl,
                  child: Container(
                    // height: c_height,
                    //       duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    // height:
                    //     getProportionateScreenHeight(450),
                    width: getProportionateScreenWidth(390),
                    padding: EdgeInsets.symmetric(
                        horizontal:
                        getProportionateScreenWidth(25),
                        vertical:
                        getProportionateScreenHeight(
                            15)),
                    // color: Colors.red,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                            getProportionateScreenHeight(
                                10),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Container(
                              width: getProportionateScreenWidth(120),
                              height: getProportionateScreenHeight(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey

                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                            getProportionateScreenHeight(
                                20),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      "النوع",
                                      style: body3_18pt,
                                    ),
                                  ),
                                  temp_selected_search_type!=0&&temp_selected_search_type!=1&&temp_selected_search_type!=2&&temp_selected_search_type!=7? Expanded(
                                    child: AutoSizeText(
                                      "المدينة",
                                      style: body3_18pt,
                                    ),
                                  ):Container(height: 0,width: 0,),
                                ],
                              ),
                              SizedBox(
                                height:
                                getProportionateScreenHeight(
                                    10),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment:
                                      Alignment.centerRight,
                                      child: Container(
                                          width:
                                          getProportionateScreenWidth(
                                              156),
                                          height:
                                          getProportionateScreenHeight(
                                              45),
                                          padding: EdgeInsets.only(
                                              right:
                                              getProportionateScreenWidth(
                                                  4)),
                                          decoration:
                                          BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(6),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey
                                                    .withOpacity(
                                                    0.6)),
                                          ),
                                          // padding: EdgeInsets.symmetric(
                                          //     horizontal: 15),
                                          child:
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              // value: controller.storeInfo.address,
                                              // value: _value,
                                              items: search_types
                                                  .map((String
                                              item) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: item,
                                                  child:
                                                  Container(
                                                    width:
                                                    getProportionateScreenWidth(
                                                        135),
                                                    height:
                                                    getProportionateScreenHeight(
                                                        30),
                                                    child:
                                                    AutoSizeText(
                                                      item,
                                                      textDirection:
                                                      TextDirection
                                                          .rtl,
                                                      style:
                                                      blackText_14pt,
                                                      minFontSize:
                                                      8,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (search_type) async {
                                                print("before");
                                                setState(() {
                                                 temp_selected_search_type =
                                                      search_types
                                                          .indexOf(
                                                          search_type);
                                                  selected_type_id=-1;
                                                  selected_category_id=-1;
                                                  price1=-1;
                                                  price2=-1;
refresh();
                                                });
                                                print("after");
                                              },
                                              hint: Text(temp_selected_search_type ==
                                                  -1
                                                  ? ""
                                                  : search_types[
                                              temp_selected_search_type]),
                                              elevation: 8,
                                              style:
                                              blackText_14pt,
                                              icon: Container(
                                                  width:
                                                  getProportionateScreenWidth(
                                                      8),
                                                  child: RotatedBox(
                                                      quarterTurns:
                                                      90,
                                                      child: Icon(
                                                          Icons
                                                              .arrow_drop_down))),
                                              iconDisabledColor:
                                              Colors.black,
                                              iconEnabledColor:
                                              Colors.blue,
                                              // isExpanded: true,
                                            ),
                                          )),
                                    ),
                                  ),
                                  temp_selected_search_type!=0&&temp_selected_search_type!=1&&temp_selected_search_type!=2&&temp_selected_search_type!=7?Expanded(
                                    child: Container(
                                      alignment:
                                      Alignment.centerRight,
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              right:
                                              getProportionateScreenWidth(
                                                  4)),
                                          width:
                                          getProportionateScreenWidth(
                                              156),
                                          height:
                                          getProportionateScreenHeight(
                                              45),
                                          decoration:
                                          BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(6),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey
                                                    .withOpacity(
                                                    0.6)),
                                          ),
                                          // padding: EdgeInsets.symmetric(
                                          //     horizontal: 15),
                                          child:
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              // value: controller.storeInfo.address,
                                              // value: _value,
                                              items: addresses
                                                  .map((City
                                              item) {
                                                return DropdownMenuItem<
                                                    City>(
                                                  value: item,
                                                  child:
                                                  Container(
                                                    // padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                                                    width:
                                                    getProportionateScreenWidth(
                                                        135),
                                                    height:
                                                    getProportionateScreenHeight(
                                                        30),
                                                    child:
                                                    AutoSizeText(
                                                      item.name,
                                                      textDirection:
                                                      TextDirection
                                                          .rtl,
                                                      style:
                                                      blackText_14pt,
                                                      minFontSize:
                                                      8,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (city) async {
                                                print("before");
                                                setState(() {
                                                  selected_city_name =
                                                      city.name;
                                                  selected_city_id =
                                                      city.id;
                                                });
                                                print("after");
                                              },
                                              hint: Text(
                                                  selected_city_name),
                                              elevation: 8,
                                              style:
                                              blackText_14pt,
                                              icon: Container(
                                                  width:
                                                  getProportionateScreenWidth(
                                                      8),
                                                  child: RotatedBox(
                                                      quarterTurns:
                                                      90,
                                                      child: Icon(
                                                          Icons
                                                              .arrow_drop_down))),
                                              iconDisabledColor:
                                              Colors.black,
                                              iconEnabledColor:
                                              Colors.blue,
                                              // isExpanded: true,
                                            ),
                                          )),
                                    ),
                                  ):Container(height: 0,width: 0,),
                                ],
                              ),
                              SizedBox(
                                height:
                                getProportionateScreenHeight(
                                    25),
                              ),
                            ],
                          ),
                          temp_selected_search_type==1||temp_selected_search_type==2? Column(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: AutoSizeText(
                                  "الصنف",
                                  style: body3_18pt,
                                ),
                              ),
                              SizedBox(
                                height:
                                getProportionateScreenHeight(
                                    15),
                              ),
                              Container(
                                height:
                                getProportionateScreenHeight(
                                    40),
                                child: ListView.builder(
                                  scrollDirection:
                                  Axis.horizontal,
                                  itemCount: vendor_category_items
                                      .length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selected_category_id ==
                                                vendor_category_items[
                                                index]
                                                    .id?selected_category_id=-1:
                                            selected_category_id =
                                                vendor_category_items[
                                                index]
                                                    .id;
                                          });
                                        },
                                        child: Container(
                                          margin:
                                          EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height:
                                          getProportionateScreenHeight(
                                              35),
                                          padding:
                                          EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8),
                                            color: selected_category_id ==
                                                vendor_category_items[
                                                index]
                                                    .id
                                                ? Color(0xFFE4F2F6)
                                                : backgroundGrey,
                                          ),
                                          child: Center(
                                              child: AutoSizeText(
                                                vendor_category_items[
                                                index]
                                                    .name,
                                                style: body2_14pt,
                                              )),
                                        ),
                                      ),
                                ),
                              ),
                              SizedBox(
                                height:
                                getProportionateScreenHeight(
                                    25),
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: AutoSizeText(
                                      "النوع",
                                      style: body3_18pt,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    getProportionateScreenHeight(
                                        15),
                                  ),
                                  Container(
                                    height:
                                    getProportionateScreenHeight(
                                        40),
                                    child: ListView.builder(
                                      scrollDirection:
                                      Axis.horizontal,
                                      itemCount: vendor_type_items
                                          .length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selected_type_id ==
                                                    vendor_type_items[
                                                    index]
                                                        .id?selected_type_id=-1:
                                                selected_type_id =
                                                    vendor_type_items[
                                                    index]
                                                        .id;
                                              });
                                            },
                                            child: Container(
                                              margin:
                                              EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              height:
                                              getProportionateScreenHeight(
                                                  35),
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                color: selected_type_id ==
                                                    vendor_type_items[
                                                    index]
                                                        .id
                                                    ? Color(0xFFE4F2F6)
                                                    : backgroundGrey,
                                              ),
                                              child: Center(
                                                  child: AutoSizeText(
                                                    vendor_type_items[
                                                    index]
                                                        .name,
                                                    style: body2_14pt,
                                                  )),
                                            ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25),),
                                  temp_selected_search_type!=1?Container(height: 0,width: 0,): Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: AutoSizeText(
                                          "السعر",
                                          style: body3_18pt,
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                              showValueIndicator:ShowValueIndicator.always ,
                                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),


                                          child: SfRangeSlider(
                                            min: _min,
                                            max: _max,
                                            values: _values,
                                            interval: 100,
                                            showTicks: true,
                                            enableTooltip: true,
                                            // showLabels: true,
                                            minorTicksPerInterval: 1,
                                            onChanged: (SfRangeValues value) {
                                              setState(() {
                                                _values = value;
                                                price1=value.start;
                                                price2=value.end;
                                              });
                                            },
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ):Container(height: 0,width: 0,),
                          Container(
                            height: getProportionateScreenHeight(60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () async {
setState((){
  selected_search_type=temp_selected_search_type;
  switch (selected_search_type)
  {
    case 0:
      searchController.searchGeneral(textSearchController.text);
      break;
    case 1:
      searchController.searchProducts(textSearchController.text,catId: selected_category_id,typeId: selected_type_id,price1: price1,price2: price2);
      break;
    case 2:
      searchController.searchOffer(textSearchController.text,catId: selected_category_id,typeId: selected_type_id, );
      break;
    case 3:
      searchController.searchStores(textSearchController.text,store: true,district: selected_city_id);
      break;
    case 4:
      searchController.searchStores(textSearchController.text,barn: true,district: selected_city_id);
      break;
    case 5:
      searchController.searchStores(textSearchController.text,sieve: true,district: selected_city_id);
      break;
    case 6:
      searchController.searchDoctors(textSearchController.text,district: selected_city_id);
      break;
    case 7:
      searchController.searchCategories(textSearchController.text,);
      break;
  }
  refresh();
});
Get.back();
                                      // if(nameController.text==""||priceController.text==""||descriptionController.text=="")
                                      // {
                                      //   CoolAlert.show(context: context, type: CoolAlertType.error,text: "الرجاء ملئ كافة الحقول قبل اضافة المنتج",title: "فشلت العملية");
                                      //   return;
                                      // }
                                      // if(image==null)
                                      // {
                                      //   CoolAlert.show(context: context, type: CoolAlertType.error,text: "الرجاء اضافة صورة للمنتج",title: "فشلت العملية",);
                                      //   return;
                                      // }
                                      //
                                      // // widget.storeProduct.id;
                                      // // widget.storeProduct.image;
                                      //
                                      // await widget.vendorProductsController.addNewProduct(  category_id:categoryId,
                                      //     type_id:typeId,
                                      //     name_ar:nameController.text,
                                      //     name_en:nameController.text,
                                      //     body_ar:descriptionController.text,
                                      //     body_en:descriptionController.text,
                                      //     image:newImage,
                                      //     price:priceController.text);
                                      // // vendorAppTabController.animateTo(0);
                                      // // vendorAppLabelController.changeIndex(0);
                                    },
                                    child: Container(
                                      width: getProportionateScreenWidth(170),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          gradient: blueGradient),
                                      child: Center(
                                        child: AutoSizeText(
                                          "إظهار النتائج ",
                                          style: blueButton_14pt,
                                        ),
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: (){

                                      // vendorAppTabController.animateTo(0);
                                      // vendorAppLabelController.changeIndex(0);
                                      Get.back();
                                    },
                                    child: Container(
                                      width: getProportionateScreenWidth(170),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border:
                                          Border.all(color: Color(0xFF49C3EA), width: 0.8)),
                                      child: Center(
                                        child: AutoSizeText(
                                          "العودة",
                                          style: body2_14pt,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(20),)


                        ],
                      ),
                    ),
                  ),
                );
          }
        );
  });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        endDrawer: CustomDrawer(),
        body: Builder(
          builder: (context) => SafeArea(
              child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Material(
                        elevation: 5,
                        color: Colors.white,
                        child: Container(
                            width: SizeConfig.screenWidth,
                            height: getProportionateScreenHeight(95),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: getProportionateScreenWidth(24),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openEndDrawer();
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey.shade50,
                                    child: Image.asset(
                                      "assets/images/home/menu_icon.png",
                                      height: 24,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                    height: getProportionateScreenHeight(28),
                                    child: AutoSizeText(
                                      "البحث",
                                      style: h5_21pt,
                                      minFontSize: 8,
                                    )),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey.shade50,
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Image.asset(
                                        "assets/images/vendor_app/back_icon.png",
                                        height: 24,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(24),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          // left: getProportionateScreenWidth(24),
                          right: getProportionateScreenWidth(24),
                          top: getProportionateScreenHeight(16),
                          bottom: getProportionateScreenHeight(8)),
                      width: getProportionateScreenWidth(345),
                      height: getProportionateScreenHeight(48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: backgroundGrey),
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/home/search_icon.png",
                                  fit: BoxFit.fill,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenHeight(20),
                                )),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              width: getProportionateScreenWidth(255),
                              height: getProportionateScreenHeight(60),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(10)),
                              child:
                                  // AutoSizeText("ابحث هنا ",style:darkGrayText_14pt,),
                                  TextField(
                                controller: textSearchController,
                                onSubmitted: (value) {

                                  switch (selected_search_type)
                                  {
                                    case 0:
                                      searchController.searchGeneral(value);
                                      break;
                                    case 1:
                                      searchController.searchProducts(value,catId: selected_category_id,typeId: selected_type_id,price1: price1,price2: price2);
                                      break;
                                    case 2:
                                      searchController.searchOffer(value,catId: selected_category_id,typeId: selected_type_id, );
                                      break;
                                    case 3:
                                      searchController.searchStores(value,store: true,district: selected_city_id);
                                      break;
                                    case 4:
                                      searchController.searchStores(value,barn: true,district: selected_city_id);
                                      break;
                                    case 5:
                                      searchController.searchStores(value,sieve: true,district: selected_city_id);
                                      break;
                                    case 6:
                                      searchController.searchDoctors(value,district: selected_city_id);
                                      break;
                                      case 7:
                                      searchController.searchCategories(value,);
                                      break;

                                  }
                                  print(value);
                                  print("submitted");
                                },
                                    onChanged: (value){
//                                   switch (selected_search_type)
//                                   {
//                                     case -1:
// searchController.searchGeneral(value);
//                                       break;
//                                        case 0:
//                                          searchController.searchProducts(value,catId: selected_category_id,typeId: selected_type_id,price1: price1,price2: price2);
//                                       break;
//                                        case 1:
// searchController.searchOffer(value,catId: selected_category_id,typeId: selected_type_id, );
//                                       break;
//                                        case 2:
// searchController.searchStores(value,store: true,district: selected_city_id);
//                                       break;
//                                        case 3:
//                                          searchController.searchStores(value,barn: true,district: selected_city_id);
//                                       break;
//                                       case 4:
//                                         searchController.searchStores(value,sieve: true,district: selected_city_id);
//                                       break;
//                                       case 5:
// searchController.searchDoctors(value,district: selected_city_id);
//                                       break;
//
//                                   }
                                    },
                                decoration: InputDecoration(
                                  hintText:
                                  "ابحث هنا",
                                  // floatingLabelBehavior:FloatingLabelBehavior.auto,
                                  hintStyle: darkGrayText_14pt,
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),

                            // Spacer(),
                            GestureDetector(
                                onTap: () {
                                  _buildBottomSheet(context,(){
                                    setState(() {

                                    });
                                  });
                           //        FocusScope.of(context).unfocus();
                           // setState(() {
                           //   filter.value==true?filter.value=false:filter.value=true;
                           // });
                             // setState(() {
                             //   if(c_height==max_height)
                             //     c_height=0;
                             //   else c_height=max_height;
                             // });
                                  // showModal(context);
                                },
                                child: Container(
                                  // color: Colors.red,
                                    height: getProportionateScreenHeight(48),
                                    width: getProportionateScreenWidth(40),
                                    // margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                    child: Container(
                                        height: getProportionateScreenHeight(12),
                                        width: getProportionateScreenWidth(20),
                                        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                        child: Image.asset(
                                          "assets/images/home/filter_icon.png",
                                          height:
                                              getProportionateScreenHeight(12),
                                          width: getProportionateScreenWidth(20),
                                        )))),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isloading
                        ? LoadingScreen()
                        : serachError
                            ? Container(
                                height: getProportionateScreenHeight(600),
                                width: getProportionateScreenWidth(390),
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "الرجاء المحاولة مجدداً",
                                  style: body3_18pt,
                                ),
                              )
                            : Column(
                                children: [
                                  filter.value
                                      ?
                                  Container(
                                    height: 0,
                                    width: 0,
                                  )
                                  
                                  // Container(
                                  //   // height: c_height,
                                  //   //       duration: Duration(seconds: 1),
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.white,
                                  //           borderRadius: BorderRadius.circular(18),
                                  //         ),
                                  //         // height:
                                  //         //     getProportionateScreenHeight(450),
                                  //         width: getProportionateScreenWidth(390),
                                  //         padding: EdgeInsets.symmetric(
                                  //             horizontal:
                                  //                 getProportionateScreenWidth(25),
                                  //             vertical:
                                  //                 getProportionateScreenHeight(
                                  //                     15)),
                                  //         // color: Colors.red,
                                  //         child: Column(
                                  //           children: [
                                  //             SizedBox(
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       10),
                                  //             ),
                                  //             Container(
                                  //               alignment: Alignment.centerRight,
                                  //               child: AutoSizeText(
                                  //                 "فلاتر البحث",
                                  //                 style: body3_21pt_nb,
                                  //               ),
                                  //             ),
                                  //             SizedBox(
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       20),
                                  //             ),
                                  //             Row(
                                  //               children: [
                                  //                 Expanded(
                                  //                   child: AutoSizeText(
                                  //                     "النوع",
                                  //                     style: body3_18pt,
                                  //                   ),
                                  //                 ),
                                  //                selected_search_type!=0&&selected_search_type!=1&&selected_search_type!=-1? Expanded(
                                  //                   child: AutoSizeText(
                                  //                     "المدينة",
                                  //                     style: body3_18pt,
                                  //                   ),
                                  //                 ):Container(height: 0,width: 0,),
                                  //               ],
                                  //             ),
                                  //             SizedBox(
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       10),
                                  //             ),
                                  //             Row(
                                  //               children: [
                                  //                 Expanded(
                                  //                   child: Container(
                                  //                     alignment:
                                  //                         Alignment.centerRight,
                                  //                     child: Container(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 156),
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 45),
                                  //                         padding: EdgeInsets.only(
                                  //                             right:
                                  //                                 getProportionateScreenWidth(
                                  //                                     4)),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(6),
                                  //                           border: Border.all(
                                  //                               width: 1,
                                  //                               color: Colors.grey
                                  //                                   .withOpacity(
                                  //                                       0.6)),
                                  //                         ),
                                  //                         // padding: EdgeInsets.symmetric(
                                  //                         //     horizontal: 15),
                                  //                         child:
                                  //                             DropdownButtonHideUnderline(
                                  //                           child: DropdownButton(
                                  //                             // value: controller.storeInfo.address,
                                  //                             // value: _value,
                                  //                             items: search_types
                                  //                                 .map((String
                                  //                                     item) {
                                  //                               return DropdownMenuItem<
                                  //                                   String>(
                                  //                                 value: item,
                                  //                                 child:
                                  //                                     Container(
                                  //                                   width:
                                  //                                       getProportionateScreenWidth(
                                  //                                           135),
                                  //                                   height:
                                  //                                       getProportionateScreenHeight(
                                  //                                           30),
                                  //                                   child:
                                  //                                       AutoSizeText(
                                  //                                     item,
                                  //                                     textDirection:
                                  //                                         TextDirection
                                  //                                             .rtl,
                                  //                                     style:
                                  //                                         blackText_14pt,
                                  //                                     minFontSize:
                                  //                                         8,
                                  //                                     maxLines: 1,
                                  //                                   ),
                                  //                                 ),
                                  //                               );
                                  //                             }).toList(),
                                  //                             onChanged:
                                  //                                 (search_type) async {
                                  //                               print("before");
                                  //                               setState(() {
                                  //                                 selected_search_type =
                                  //                                     search_types
                                  //                                         .indexOf(
                                  //                                             search_type);
                                  //                                 selected_type_id=-1;
                                  //                                 selected_category_id=-1;
                                  //                                 price1=-1;
                                  //                                 price2=-1;
                                  //
                                  //                               });
                                  //                               print("after");
                                  //                             },
                                  //                             hint: Text(selected_search_type ==
                                  //                                     -1
                                  //                                 ? ""
                                  //                                 : search_types[
                                  //                                     selected_search_type]),
                                  //                             elevation: 8,
                                  //                             style:
                                  //                                 blackText_14pt,
                                  //                             icon: Container(
                                  //                                 width:
                                  //                                     getProportionateScreenWidth(
                                  //                                         8),
                                  //                                 child: RotatedBox(
                                  //                                     quarterTurns:
                                  //                                         90,
                                  //                                     child: Icon(
                                  //                                         Icons
                                  //                                             .arrow_drop_down))),
                                  //                             iconDisabledColor:
                                  //                                 Colors.black,
                                  //                             iconEnabledColor:
                                  //                                 Colors.blue,
                                  //                             // isExpanded: true,
                                  //                           ),
                                  //                         )),
                                  //                   ),
                                  //                 ),
                                  //                 selected_search_type!=0&&selected_search_type!=1&&selected_search_type!=-1?Expanded(
                                  //                   child: Container(
                                  //                     alignment:
                                  //                         Alignment.centerRight,
                                  //                     child: Container(
                                  //                         padding: EdgeInsets.only(
                                  //                             right:
                                  //                                 getProportionateScreenWidth(
                                  //                                     4)),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 156),
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 45),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(6),
                                  //                           border: Border.all(
                                  //                               width: 1,
                                  //                               color: Colors.grey
                                  //                                   .withOpacity(
                                  //                                       0.6)),
                                  //                         ),
                                  //                         // padding: EdgeInsets.symmetric(
                                  //                         //     horizontal: 15),
                                  //                         child:
                                  //                             DropdownButtonHideUnderline(
                                  //                           child: DropdownButton(
                                  //                             // value: controller.storeInfo.address,
                                  //                             // value: _value,
                                  //                             items: addresses
                                  //                                 .map((City
                                  //                                     item) {
                                  //                               return DropdownMenuItem<
                                  //                                   City>(
                                  //                                 value: item,
                                  //                                 child:
                                  //                                     Container(
                                  //                                   // padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                                  //                                   width:
                                  //                                       getProportionateScreenWidth(
                                  //                                           135),
                                  //                                   height:
                                  //                                       getProportionateScreenHeight(
                                  //                                           30),
                                  //                                   child:
                                  //                                       AutoSizeText(
                                  //                                     item.name,
                                  //                                     textDirection:
                                  //                                         TextDirection
                                  //                                             .rtl,
                                  //                                     style:
                                  //                                         blackText_14pt,
                                  //                                     minFontSize:
                                  //                                         8,
                                  //                                     maxLines: 1,
                                  //                                   ),
                                  //                                 ),
                                  //                               );
                                  //                             }).toList(),
                                  //                             onChanged:
                                  //                                 (city) async {
                                  //                               print("before");
                                  //                               setState(() {
                                  //                                 selected_city_name =
                                  //                                     city.name;
                                  //                                 selected_city_id =
                                  //                                     city.id;
                                  //                               });
                                  //                               print("after");
                                  //                             },
                                  //                             hint: Text(
                                  //                                 selected_city_name),
                                  //                             elevation: 8,
                                  //                             style:
                                  //                                 blackText_14pt,
                                  //                             icon: Container(
                                  //                                 width:
                                  //                                     getProportionateScreenWidth(
                                  //                                         8),
                                  //                                 child: RotatedBox(
                                  //                                     quarterTurns:
                                  //                                         90,
                                  //                                     child: Icon(
                                  //                                         Icons
                                  //                                             .arrow_drop_down))),
                                  //                             iconDisabledColor:
                                  //                                 Colors.black,
                                  //                             iconEnabledColor:
                                  //                                 Colors.blue,
                                  //                             // isExpanded: true,
                                  //                           ),
                                  //                         )),
                                  //                   ),
                                  //                 ):Container(height: 0,width: 0,),
                                  //               ],
                                  //             ),
                                  //             SizedBox(
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       25),
                                  //             ),
                                  //             selected_search_type==0||selected_search_type==1? Column(
                                  //               children: [
                                  //                 Container(
                                  //                   alignment: Alignment.centerRight,
                                  //                   child: AutoSizeText(
                                  //                     "الصنف",
                                  //                     style: body3_18pt,
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height:
                                  //                   getProportionateScreenHeight(
                                  //                       15),
                                  //                 ),
                                  //                 Container(
                                  //                   height:
                                  //                   getProportionateScreenHeight(
                                  //                       40),
                                  //                   child: ListView.builder(
                                  //                     scrollDirection:
                                  //                     Axis.horizontal,
                                  //                     itemCount: vendor_category_items
                                  //                         .length,
                                  //                     itemBuilder: (context, index) =>
                                  //                         GestureDetector(
                                  //                           onTap: () {
                                  //                             setState(() {
                                  //                               selected_category_id ==
                                  //                                   vendor_category_items[
                                  //                                   index]
                                  //                                       .id?selected_category_id=-1:
                                  //                               selected_category_id =
                                  //                                   vendor_category_items[
                                  //                                   index]
                                  //                                       .id;
                                  //                             });
                                  //                           },
                                  //                           child: Container(
                                  //                             margin:
                                  //                             EdgeInsets.symmetric(
                                  //                                 horizontal: 5),
                                  //                             height:
                                  //                             getProportionateScreenHeight(
                                  //                                 35),
                                  //                             padding:
                                  //                             EdgeInsets.symmetric(
                                  //                                 horizontal: 8,
                                  //                                 vertical: 5),
                                  //                             decoration: BoxDecoration(
                                  //                               borderRadius:
                                  //                               BorderRadius.circular(
                                  //                                   8),
                                  //                               color: selected_category_id ==
                                  //                                   vendor_category_items[
                                  //                                   index]
                                  //                                       .id
                                  //                                   ? Color(0xFFE4F2F6)
                                  //                                   : backgroundGrey,
                                  //                             ),
                                  //                             child: Center(
                                  //                                 child: AutoSizeText(
                                  //                                   vendor_category_items[
                                  //                                   index]
                                  //                                       .name,
                                  //                                   style: body2_14pt,
                                  //                                 )),
                                  //                           ),
                                  //                         ),
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height:
                                  //                   getProportionateScreenHeight(
                                  //                       25),
                                  //                 ),
                                  //                 Container(
                                  //                   alignment: Alignment.centerRight,
                                  //                   child: AutoSizeText(
                                  //                     "النوع",
                                  //                     style: body3_18pt,
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   height:
                                  //                   getProportionateScreenHeight(
                                  //                       15),
                                  //                 ),
                                  //                 Container(
                                  //                   height:
                                  //                   getProportionateScreenHeight(
                                  //                       40),
                                  //                   child: ListView.builder(
                                  //                     scrollDirection:
                                  //                     Axis.horizontal,
                                  //                     itemCount: vendor_type_items
                                  //                         .length,
                                  //                     itemBuilder: (context, index) =>
                                  //                         GestureDetector(
                                  //                           onTap: () {
                                  //                             setState(() {
                                  //                               selected_type_id ==
                                  //                                   vendor_type_items[
                                  //                                   index]
                                  //                                       .id?selected_type_id=-1:
                                  //                               selected_type_id =
                                  //                                   vendor_type_items[
                                  //                                   index]
                                  //                                       .id;
                                  //                             });
                                  //                           },
                                  //                           child: Container(
                                  //                             margin:
                                  //                             EdgeInsets.symmetric(
                                  //                                 horizontal: 5),
                                  //                             height:
                                  //                             getProportionateScreenHeight(
                                  //                                 35),
                                  //                             padding:
                                  //                             EdgeInsets.symmetric(
                                  //                                 horizontal: 8,
                                  //                                 vertical: 5),
                                  //                             decoration: BoxDecoration(
                                  //                               borderRadius:
                                  //                               BorderRadius.circular(
                                  //                                   8),
                                  //                               color: selected_type_id ==
                                  //                                   vendor_type_items[
                                  //                                   index]
                                  //                                       .id
                                  //                                   ? Color(0xFFE4F2F6)
                                  //                                   : backgroundGrey,
                                  //                             ),
                                  //                             child: Center(
                                  //                                 child: AutoSizeText(
                                  //                                   vendor_type_items[
                                  //                                   index]
                                  //                                       .name,
                                  //                                   style: body2_14pt,
                                  //                                 )),
                                  //                           ),
                                  //                         ),
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(height: getProportionateScreenHeight(25),),
                                  //                selected_search_type!=0?Container(height: 0,width: 0,): Column(
                                  //                   children: [
                                  //                     Container(
                                  //                       alignment: Alignment.centerRight,
                                  //                       child: AutoSizeText(
                                  //                         "السعر",
                                  //                         style: body3_18pt,
                                  //                       ),
                                  //                     ),
                                  //                     Directionality(
                                  //                       textDirection: TextDirection.rtl,
                                  //                       child: SliderTheme(
                                  //                         data: SliderThemeData(
                                  //                             showValueIndicator:ShowValueIndicator.always ,
                                  //                             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
                                  //
                                  //
                                  //                         child: SfRangeSlider(
                                  //                           min: _min,
                                  //                           max: _max,
                                  //                           values: _values,
                                  //                           interval: 100,
                                  //                           showTicks: true,
                                  //                           enableTooltip: true,
                                  //                           // showLabels: true,
                                  //                           minorTicksPerInterval: 1,
                                  //                           onChanged: (SfRangeValues value) {
                                  //                             setState(() {
                                  //                               _values = value;
                                  //                               price1=value.start;
                                  //                               price2=value.end;
                                  //                             });
                                  //                           },
                                  //                         ),
                                  //                       ),
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ],
                                  //             ):Container(height: 0,width: 0,),
                                  //           ],
                                  //         ),
                                  //       )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                        ),
                                  SizedBox(height: getProportionateScreenHeight(25),),
                                  Container(
                                    margin: EdgeInsets.only(right: getProportionateScreenWidth(24)),
                                    child: selected_search_type==1?Column(
                                      children: [
                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("المنتجات",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen():Container(

                                              child: controller.products.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها ",style: body1_16pt,),):Container(
                                                height: getProportionateScreenHeight(150),
                                                child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.products.length,
                                                    itemBuilder: (context, index) =>
                                                        HomeStoreProductCard(controller.products[index],()async{
                                                          bool k=
                                                          await addProductToFavorite(controller.products[index].id);
                                                          setState(() {
                                                            if(k) controller.products[index].favStatus=(!controller.products[index].favStatus);});

                                                          return k;
                                                        })
                                                ),
                                              )),
                                        ),
                                      ],
                                    ): selected_search_type==2?Column(
                                      children: [

                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("العروض",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen(): Container(
                                            height: getProportionateScreenHeight(225),
                                            child: controller.offers.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها حالياً",style: body1_16pt,),):ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller .offers.length,
                                              itemBuilder: (context, index) => OfferCard(controller .offers[index],()async{
                                                bool k=
                                                await addOfferToFavorite(controller .offers[index].id);
                                                setState(() {

                                                  if(k) controller .offers[index].favStatus=(!controller .offers[index].favStatus);
                                                });
                                                return k;
                                              }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ):selected_search_type==3?Column(
                                      children: [
                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("المتاجر",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen():Container(
                                            height: getProportionateScreenHeight(220),
                                            child: controller.stores.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها حالياً",style: body1_16pt,),):ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.stores.length,
                                              itemBuilder: (context, index) =>
                                                  StoreAndStableCard(controller.stores[index],()async{
                                                    bool k=
                                                    await addStoreToFavorite(controller.stores[index].id);
                                                    setState(() {

                                                      if(k) controller.stores[index].favStatus=(!controller.stores[index].favStatus);
                                                    });
                                                    return k;
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ):selected_search_type==4?Column(
                                      children: [
                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("الاسطبلات",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen():Container(
                                            height: getProportionateScreenHeight(220),
                                            child: controller.stores.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها حالياً",style: body1_16pt,),):ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.stores.length,
                                              itemBuilder: (context, index) =>
                                                  StoreAndStableCard(controller.stores[index],()async{
                                                    bool k=
                                                    await addBarnToFavorite(controller.stores[index].id);
                                                    setState(() {

                                                      if(k) controller.stores[index].favStatus=(!controller.stores[index].favStatus);
                                                    });
                                                    return k;
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ):selected_search_type==5?Column(
                                      children: [
                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("المناحل",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen():      Container(
                                            height: getProportionateScreenHeight(220),
                                            child: controller.stores.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها حالياً",style: body1_16pt,),):ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.stores.length,
                                              itemBuilder: (context, index) =>
                                                  StoreAndStableCard(controller.stores[index],()async{
                                                    bool k=
                                                    await addSieveToFavorite(controller.stores[index].id);
                                                    setState(() {

                                                      if(k) controller.stores[index].favStatus=(!controller.stores[index].favStatus);
                                                    });
                                                    return k;
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ):selected_search_type==6?Column(
                                      children: [
                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("الاطباء",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen():Container(
                                              height: getProportionateScreenHeight(230),
                                              child: controller.doctors.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها ",style: body1_16pt,),):
                                              ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: controller.doctors.length,
                                                  itemBuilder: (context, index) =>
                                                      DoctorCard(controller.doctors[index],()async{
                                                        bool k=
                                                        await addDoctorToFavorite(controller.doctors[index].id);
                                                        setState(() {
                                                          if(k) controller.doctors[index].favStatus=(!controller.doctors[index].favStatus);});

                                                        return k;
                                                      })
                                              )),
                                        ),
                                      ],
                                    ):selected_search_type==7?Column(
                                      children: [
                                        Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("الأصناف",style: body3_21pt_nb,),),
                                        GetBuilder<SearchController>(
                                          init: searchController,
                                          builder:(controller)=> controller.loading?LoadingScreen():Container(
                                              height: getProportionateScreenHeight(172),
                                              child: controller.categories.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها ",style: body1_16pt,),):
                                              ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: controller.categories.length,
                                                  itemBuilder: (context, index) =>
                                                      CategoryCard(controller.categories[index])
                                              )),
                                        ),
                                      ],
                                    ):selected_search_type==0?Column(
                                      children: [
                                        Column(
                                          children: [
                                            Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("المنتجات",style: body3_21pt_nb,),),
                                            GetBuilder<SearchController>(
                                              init: searchController,
                                              builder:(controller)=> controller.loading?LoadingScreen():Container(

                                                  child: controller.products.length==0?Center(child: AutoSizeText("لا يوجد منتجات مطابقة ",style: body1_16pt,),):Container(
                                                    height: getProportionateScreenHeight(152),
                                                    child: ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: controller.products.length,
                                                        itemBuilder: (context, index) =>
                                                            HomeStoreProductCard(controller.products[index],()async{
                                                              bool k=
                                                              await addProductToFavorite(controller.products[index].id);
                                                              setState(() {
                                                                if(k) controller.products[index].favStatus=(!controller.products[index].favStatus);});

                                                              return k;
                                                            })
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: getProportionateScreenHeight( 25),),
                                        Column(
                                          children: [

                                            Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("العروض",style: body3_21pt_nb,),),
                                            GetBuilder<SearchController>(
                                              init: searchController,
                                              builder:(controller)=> controller.loading?LoadingScreen(): Container(
                                              
                                                child: controller.offers.length==0?Center(child: AutoSizeText("لا يوجد عروض مطابقة",style: body1_16pt,),):Container(
                                                  height: getProportionateScreenHeight(225),
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller .offers.length,
                                                    itemBuilder: (context, index) => OfferCard(controller .offers[index],()async{
                                                      bool k=
                                                      await addOfferToFavorite(controller .offers[index].id);
                                                      setState(() {

                                                        if(k) controller .offers[index].favStatus=(!controller .offers[index].favStatus);
                                                      });
                                                      return k;
                                                    }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height:getProportionateScreenHeight( 25)),
                                      Column(
                                          children: [
                                            Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("المتاجر",style: body3_21pt_nb,),),
                                            GetBuilder<SearchController>(
                                              init: searchController,
                                              builder:(controller)=> controller.loading?LoadingScreen():Container(
                           
                                                child: controller.stores.length==0?Center(child: AutoSizeText("لا يوجد متاجر مطابقة ",style: body1_16pt,),):Container(
                                                  height: getProportionateScreenHeight(220),
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.stores.length,
                                                    itemBuilder: (context, index) =>
                                                        StoreAndStableCard(controller.stores[index],()async{
                                                          bool k=
                                                          await addStoreToFavorite(controller.stores[index].id);
                                                          setState(() {

                                                            if(k) controller.stores[index].favStatus=(!controller.stores[index].favStatus);
                                                          });
                                                          return k;
                                                        })
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height:getProportionateScreenHeight( 25)),
                                        Column(
                                          children: [
                                            Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("الاسطبلات",style: body3_21pt_nb,),),
                                            GetBuilder<SearchController>(
                                              init: searchController,
                                              builder:(controller)=> controller.loading?LoadingScreen():Container(

                                                child: controller.barns.length==0?Center(child: AutoSizeText("لا يوجد اسطبلات مطابقة",style: body1_16pt,),): Container(
                                                  height: getProportionateScreenHeight(220),
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.barns.length,
                                                    itemBuilder: (context, index) =>
                                                        StoreAndStableCard(controller.barns[index],()async{
                                                          bool k=
                                                          await addBarnToFavorite(controller.barns[index].id);
                                                          setState(() {

                                                            if(k) controller.barns[index].favStatus=(!controller.barns[index].favStatus);
                                                          });
                                                          return k;
                                                        })
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height:getProportionateScreenHeight( 25)),
                                        Column(
                                          children: [
                                            Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("المناحل",style: body3_21pt_nb,),),
                                            GetBuilder<SearchController>(
                                              init: searchController,
                                              builder:(controller)=> controller.loading?LoadingScreen():      Container(

                                                child: controller.sieves.length==0?Center(child: AutoSizeText("لا يوجد مناحل مطابقة",style: body1_16pt,),):Container(
                                                  height: getProportionateScreenHeight(220),
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.sieves.length,
                                                    itemBuilder: (context, index) =>
                                                        StoreAndStableCard(controller.sieves[index],()async{
                                                          bool k=
                                                          await addSieveToFavorite(controller.sieves[index].id);
                                                          setState(() {

                                                            if(k) controller.sieves[index].favStatus=(!controller.sieves[index].favStatus);
                                                          });
                                                          return k;
                                                        })
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                     SizedBox(height:getProportionateScreenHeight( 25)),
                                        Column(
                                          children: [
                                            Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("الاطباء",style: body3_21pt_nb,),),
                                            GetBuilder<SearchController>(
                                              init: searchController,
                                              builder:(controller)=> controller.loading?LoadingScreen():Container(

                                                  child: controller.doctors.length==0?Center(child: AutoSizeText("لا يوجد اطباء مطابقين ",style: body1_16pt,),):
                                                  Container(
                                                    height: getProportionateScreenHeight(230),
                                                    child: ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: controller.doctors.length,
                                                        itemBuilder: (context, index) =>
                                                            DoctorCard(controller.doctors[index],()async{
                                                              bool k=
                                                              await addDoctorToFavorite(controller.doctors[index].id);
                                                              setState(() {
                                                                if(k) controller.doctors[index].favStatus=(!controller.doctors[index].favStatus);});

                                                              return k;
                                                            })
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(25),),
                                            Column(
                                              children: [
                                                Container(margin:EdgeInsets.only( bottom: getProportionateScreenHeight(25)),height: getProportionateScreenHeight(30),alignment:Alignment.centerRight,child: AutoSizeText("الأصناف",style: body3_21pt_nb,),),
                                                GetBuilder<SearchController>(
                                                  init: searchController,
                                                  builder:(controller)=> controller.loading?LoadingScreen():Container(
                                                      height: getProportionateScreenHeight(173),
                                                      child: controller.categories.length==0?Center(child: AutoSizeText("لا يوجد عناصر لعرضها ",style: body1_16pt,),):
                                                      ListView.builder(
                                                          scrollDirection: Axis.horizontal,
                                                          itemCount: controller.categories.length,
                                                          itemBuilder: (context, index) =>
                                                              CategoryCard(controller.categories[index])
                                                      )),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(25),),
                                          ],
                                        )
                                      ],
                                    ):Container(height: 0,width: 0,),
                                  ),

                                ],
                              ),
                  ],
                ),
              ),
            ),
          )),
        ));
  }
  final double _min = 0;
  final double _max = 1000;
  SfRangeValues _values = const SfRangeValues(40.0, 60.0);
double price1=-1;
double price2=-1;
}



