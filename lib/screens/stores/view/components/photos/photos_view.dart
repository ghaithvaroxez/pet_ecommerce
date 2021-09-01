import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/image_model.dart' as im;
@JsonSerializable(explicitToJson: true)
class StorePhotosView extends StatefulWidget {
  List<im.Image> images;
  int index;
  StorePhotosView(this.images,this.index);
  @override
  _StorePhotosViewState createState() => _StorePhotosViewState();
}

class _StorePhotosViewState extends State<StorePhotosView> {
  List<im.Image> myImages=[];
  List<im.Image> before=[];
  List<im.Image> after=[];

  @override
  void initState() {
    consolePrint(widget.index.toString());
    // TODO: implement initState
    super.initState();
    // before=widget.images.sublist(0,widget.index);
    // after=widget.images.sublist(widget.index,widget.images.length-1);
    // // if(widget.images.length>1)
    // // after.add(widget.images[widget.images.length-1]);
    // if(widget.images.length==1)
    //   after.add(widget.images[0]);
    // myImages.addAll(after);
    // myImages.addAll(before);
    for(int i=widget.index;i<widget.images.length;i++)
      {
        myImages.add(widget.images[i]);
      }
    for(int i=0;i<widget.images.length;i++)
      {
        myImages.add(widget.images[i]);
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 25,
              ),
              height: getProportionateScreenHeight(550),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Swiper(
                // autoplay: true,
                // autoplayDelay: 5000,
                // autoplayDisableOnInteraction: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: getProportionateScreenWidth(2),right: getProportionateScreenWidth(2),bottom: getProportionateScreenHeight(50)),
                      child: ClipRRect(borderRadius:BorderRadius.circular(12),child: Image.network(Api.imagePath+myImages[index].path,)),
                    ),
                  );
                },
                itemCount: myImages.length,
                // pagination: new SwiperPagination(),
                duration: 3000,
                // control: new SwiperControl(color: Colors.grey),
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
