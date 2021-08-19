import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/corner/model/corner_model.dart';
// import 'package:pets_ecommerce/screens/vendor_app/model/image_model.dart' as im;
@JsonSerializable(explicitToJson: true)
class CornerPhotosView extends StatefulWidget {
  List<Img> images;
  int index;
  CornerPhotosView(this.images,this.index);
  @override
  _CornerPhotosViewState createState() => _CornerPhotosViewState();
}

class _CornerPhotosViewState extends State<CornerPhotosView> {
  List<Img> myImages=[];
  List<Img> before=[];
  List<Img> after=[];

  @override
  void initState() {
    consolePrint(widget.index.toString());
    // TODO: implement initState
    super.initState();
    before=widget.images.sublist(0,widget.index);
    after=widget.images.sublist(widget.index,widget.images.length-1);
    if(widget.images.length>1)
      after.add(widget.images[widget.images.length-1]);
    if(widget.images.length==1)
      after.add(widget.images[0]);
    myImages.addAll(after);
    myImages.addAll(before);
    // myImages.addAll(widget.images);
    // for(int i=widget.index;i<after.length;i++)
    //   {
    //     myImages.add(after[i]);
    //   }
    // for(int i=0;i<before.length;i++)
    //   {
    //     myImages.add(before[i]);
    //   }
    // for(int i=widget.index;i<widget.images.length;i++)
    // {
    //   myImages.add(widget.images[i]);
    // }
    // for(int i=0;i<widget.images.length;i++)
    // {
    //   myImages.add(widget.images[i]);
    // }
    swiperController.index=widget.index;
  }

  SwiperController swiperController=SwiperController();



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

                // controller: swiperController,
                // loop: false,
                // outer: true,
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
