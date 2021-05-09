// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:vc_mall/config/size_config.dart';

import '../widgets/block_header.dart';
import '../config/theme.dart';

class Main1View extends StatelessWidget {
//  @override
//  _Main1ViewState createState() => _Main1ViewState();
//}

//class _Main1ViewState extends State<Main1View> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 150,
          width: 400,
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Image(
                image: AssetImage(
                  'assets/placeholder.png',
                ),
                fit: BoxFit.fill,
              );
            },
            duration: 2000,
            itemCount: 3,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
        SizedBox(height: AppSizes.tile_height - 230),
        Container(
          height: 400,
        ),
        Container(
          width: width,
          height: 50,
          color: Colors.blueGrey,
        ),
        OpenFlutterBlockHeader(
          width: widgetWidth,
          title: 'New',
          linkText: 'View All',
          onLinkTap: () => {
//                Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
//                    arguments: CategoriesParameters(0))
          },
          description: 'You’ve never seen it before!',
        ),
        Container(
          height: 400,
        ),
        Row(
          children: [
            Container(
              width: width / 2,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: width / 2,
              height: 100,
              color: Colors.green,
            ),
          ],
        ),
        OpenFlutterBlockHeader(
          width: widgetWidth,
          title: 'Mobile Accessories',
          linkText: 'View All',
          onLinkTap: () => {
//                Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
//                    arguments: CategoriesParameters(0))
          },
          description: 'Check out the discounts!',
        ),
        Container(
          height: 400,
        ),
        Row(
          children: [
            Container(
              width: width / 2,
              height: 100,
              color: Colors.blue,
            ),
            Container(
              width: width / 2,
              height: 100,
              color: Colors.green,
            )
          ],
        ),
        OpenFlutterBlockHeader(
          width: widgetWidth,
          title: 'Food Stores',
          linkText: 'View All',
          onLinkTap: () => {
//                Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
//                    arguments: CategoriesParameters(0))
          },
          description: 'Discounts Up to 30%!',
        ),
        Container(
          height: 400,
        ),
        Row(
          children: [
            Container(
              width: width / 2,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: width / 2,
              height: 100,
              color: Colors.deepPurple,
            )
          ],
        ),
        OpenFlutterBlockHeader(
          width: widgetWidth,
          title: 'Recently Viewed',
          linkText: 'View All',
          onLinkTap: () => {
//                Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
//                    arguments: CategoriesParameters(0))
          },
        ),
        Container(
          height: 400,
        ),
        Row(
          children: [
            Container(
              width: width / 2,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: width / 2,
              height: 100,
              color: Colors.deepPurple,
            )
          ],
        ),
        OpenFlutterBlockHeader(
          width: widgetWidth,
          title: 'Food Shelves',
          linkText: 'View All',
          onLinkTap: () => {
//                Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
//                    arguments: CategoriesParameters(0))
          },
          description: 'Discounts Up to 30%!',
        ),
        Container(
          height: 400,
        ),
        Row(
          children: [
            Container(
              width: width / 2,
              height: 100,
              color: Colors.pink,
            ),
            Container(
              width: width / 2,
              height: 100,
              color: Colors.deepPurple,
            )
          ],
        ),
        OpenFlutterBlockHeader(
          width: widgetWidth,
          title: 'Suggestions',
          linkText: 'View All',
          onLinkTap: () => {
//                Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
//                    arguments: CategoriesParameters(0))
          },
        ),
        Container(
          height: 400,
        )
      ],
    ));
  }
}
