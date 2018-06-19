import 'package:tlv_bloc_core_flutter_master/app_provider.dart';
import 'package:tlv_bloc_core_flutter_master/models/response/category.dart';
import 'package:tlv_bloc_core_flutter_master/screens/home/explore/explore_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tlv_bloc_core_flutter_master/models/request/categories_request.dart';
class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() {
    // TODO: implement createState
    return new ExploreState();
  }
}

class ExploreState extends State<ExploreScreen> {
  bool _checkConfiguration() => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_checkConfiguration()) {
      new Future.delayed(Duration.zero,() {
        ExploreBloc exploreBloc= AppProvider.of(context).exploreBloc;
        CategoriesRequest categoriesRequest=new CategoriesRequest(page: 1,pageSize: 30);
        exploreBloc.categories.add(categoriesRequest);
        print("init state");
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    final appBloc = AppProvider.of(context);
    // TODO: implement build
    return new Scaffold(
      body: new StreamBuilder(
          stream: appBloc.exploreBloc.categoriesStream,
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      new ExploreItem(category: snapshot.data[index]),
                  itemCount: snapshot.data.length);
            } else {
              return new Text("ranh qua");
            }
          }),
    );
  }
}

class ExploreItem extends StatelessWidget {
  ExploreItem({this.category}) : assert(category != null);
  final Category category;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var url;
    if (category.files.length > 0) url = category.files[0].medium_url;
    return new Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: url == null
                  ? new AssetImage('assets/bg_explore.png')
                  : new NetworkImage(url),
              fit: BoxFit.cover),
        ),
        child: new Container(
          decoration:
              new BoxDecoration(color: new Color.fromRGBO(0, 0, 0, 0.38)),
          child: new Center(
            child: new Text(
              category.name,
              style: new TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
