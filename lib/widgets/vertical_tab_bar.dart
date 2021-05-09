import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vc_mall/widgets/search_field.dart';

import '../View_Categories/view_automobile.dart';
import '../View_Categories/view_baby.dart';
import '../View_Categories/view_computing.dart';
import '../View_Categories/view_electronics.dart';
import '../View_Categories/view_femalfashion.dart';
import '../View_Categories/view_gaming.dart';
import '../View_Categories/view_health.dart';
import '../View_Categories/view_homeoffice.dart';
import '../View_Categories/view_malefashion.dart';
import '../View_Categories/view_phone.dart';
import '../View_Categories/view_sports.dart';
import '../View_Categories/view_supermakert.dart';
import 'block_header.dart';

class VerticalTabBar extends StatefulWidget {
  @override
  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar>
    with SingleTickerProviderStateMixin {
  String title = 'Screen 0';
  TabController _tabController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    _tabController = TabController(initialIndex: 0, length: 12, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    var width = MediaQuery.of(context).size.width;
    var width1 = MediaQuery.of(context).size.width * 0.27;
    double padding = 8;
    TextAlign textAlign = TextAlign.center;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  child: Text(
                    'Lagos',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          }),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 16.0),
              child: OpenFlutterBlockHeader(
                width: width,
                title: 'Categories',
              ),
            ),
            Container(
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Column(children: [
                          TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.blue,
                            indicatorWeight: 3,
                            controller: _tabController,
                            tabs: <Widget>[
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Supermarket',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Health & Beauty',
                                      softWrap: true,
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Phone & Tablets',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Computing',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                      child: Text(
                                    'Electronics',
                                    textAlign: textAlign,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 11),
                                  )),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Women' 's Fashion',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Men' 's Fashion',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Baby Products',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Home & Office',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Gaming',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Sporting Goods',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                              getItem(
                                text: Container(
                                  padding: EdgeInsets.all(padding),
                                  width: width1,
                                  height: height,
                                  child: Center(
                                    child: Text(
                                      'Automobile',
                                      textAlign: textAlign,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          View(),
                          ViewHealth(Colors.blueGrey),
                          ViewPhone(Colors.blue),
                          ViewComputing(Colors.brown),
                          ViewElectronics(Colors.green),
                          ViewFemale(Colors.deepPurple),
                          ViewMale(Colors.deepOrange),
                          ViewBaby(Colors.pink),
                          ViewHome(Colors.red),
                          ViewGaming(Colors.yellow),
                          ViewSport(Colors.orange),
                          ViewAuto(Colors.blueGrey)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getItem({Container text}) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[text],
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}
