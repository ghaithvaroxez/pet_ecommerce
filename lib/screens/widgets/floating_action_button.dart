import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed1;
  final Function() onPressed2;
  final String tooltip;
  final IconData icon;
bool story;
  FancyFab({this.onPressed1,this.onPressed2, this.tooltip, this.icon,this.story=false});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget addProduct() {

    // return CircleAvatar(
    //   radius: 28,
    //   backgroundColor: Colors.transparent,
    //   backgroundImage:  AssetImage("assets/images/vendor_app/add_product_icon.png"),
    // );
    return TextButton(
      onPressed: (){widget.onPressed1();animate();},


      child: Container(

        height: 48,
        width: 48,
        decoration: BoxDecoration(
          // color: Colors.redAccent,
        ),
        // child:
        // FloatingActionButton(

          // backgroundColor: Colors.transparent.withOpacity(0),
          // onPressed: null,
          // tooltip: 'Image',
          child:  Image.asset(widget.story?"assets/images/vendor_app/add_video.png":"assets/images/vendor_app/add_product_icon.png",fit: BoxFit.fill,),
          // child: Icon(Icons.image),
        // ),
      ),
    );
  }

  Widget addOffer() {
    return GestureDetector(
      onTap: (){widget.onPressed2();animate();},


      child: Container(
        width: 48,
        height: 48,
        // child: FloatingActionButton(

          // backgroundColor: Colors.transparent,
          // onPressed: null,
          // tooltip: 'Inbox',
          child: Image.asset(
           widget.story?"assets/images/vendor_app/add_photo.png":"assets/images/vendor_app/add_offer_icon.png",
            fit: BoxFit.fill,
          ),
        // ),
      ),
    );
  }

  Widget toggle() {
    return
        GestureDetector(
          onTap: animate,
          child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF49C3EA),
          shape: BoxShape.circle
        ),
          width: 52,
          height: 52,

          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),);
      // Container(
//       width: 45,
//       height: 45,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
// gradient: blueGradient
//       ),
//       child: GestureDetector(
//
//         onTap: animate,
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Transform(
        //   transform: Matrix4.translationValues(
        //     0.0,
        //     _translateButton.value * 3.0,
        //     0.0,
        //   ),
        //   child: add(),
        // ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: addProduct(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: addOffer(),
        ),
        toggle(),
      ],
    );
  }
}