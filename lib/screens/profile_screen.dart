import 'package:flutter/material.dart';
import 'package:vc_mall/my_shop.dart';
import 'package:vc_mall/widgets/block_header.dart';
import 'package:vc_mall/widgets/search_field.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
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
                            icon: Icon(Icons.notifications_none),
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
                  title: 'My Profile',
                ),
              ),
              Container(
//                height: MediaQuery.of(context).size.height * 0.5,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 30,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Miracle Okolo',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  ),
                                  Text(
                                    'okolomiracle72@outlook.com',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.edit),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
//                       height: MediaQuery.of(context).size.height * 0.5,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,'My Shop',
                                      'Re-model your shop and add new products'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,'Favorites', '10 favorites'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,
                                      'Shipping addresses', '3 addresses'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,'Payment methods', 'visa **34'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,'My reviews', '4 items reviewed'),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,'Settings',
                                      'Notifications,Face-ID,passwords'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  profilelist(context,'Sign-in/Sign-out',
                                      'Notifications,Face-ID,passwords'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profilelist(BuildContext context,String title, String subtitle) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                )
              ],
            ),
            Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, MyShop.routeName);
      },
    );
  }
}
