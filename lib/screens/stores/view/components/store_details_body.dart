import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class StoreDetailsBody extends StatefulWidget {
  @override
  _StoreDetailsBodyState createState() => _StoreDetailsBodyState();
}

class _StoreDetailsBodyState extends State<StoreDetailsBody>with SingleTickerProviderStateMixin {
  TabController _tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override

  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(child: Column(
        children: [
          SizedBox(height: 100
            ,),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(child:Container(width: MediaQuery.of(context).size.width/4,  decoration: BoxDecoration(color: Colors.red),),),
              Tab(child: Container( decoration: BoxDecoration(color: Colors.grey),),),
              Tab(child: Container( decoration: BoxDecoration(color: Colors.grey),),),
              Tab(child: Container( decoration: BoxDecoration(color: Colors.grey),),),
            ],),
        ],
      ),),
    );
  }
}
