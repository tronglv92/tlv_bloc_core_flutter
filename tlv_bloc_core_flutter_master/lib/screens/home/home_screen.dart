import 'package:flutter/material.dart';
import 'package:tlv_bloc_core_flutter_master/screens/home/explore/explore_screen.dart';
import 'package:tlv_bloc_core_flutter_master/screens/home/profile/profile_screen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(tabs: [
            new Tab(icon: new Icon(Icons.view_list),),
            new Tab(icon: new Icon(Icons.person),)
          ]),
        ),
        body: new TabBarView(children: [
          new ExploreScreen(),
          new ProfileScreen()
        ]),
      ),);
  }

}