import 'package:flutter/material.dart';
import 'dart:math';

class MyHeader extends SliverPersistentHeaderDelegate {
  BuildContext context;
  final TabBar bottom;

  final Widget top;

  MyHeader({this.bottom, this.top, this.context});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Colors.white,
          height: max(
              kToolbarHeight +
                  bottom.preferredSize.height +
                  MediaQuery.of(context).size.height * 0.05,
              maxExtent - shrinkOffset),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            if (top != null)
              SizedBox(
                  height:
                      kToolbarHeight + MediaQuery.of(context).size.height* 0.03,
                  child: top),
            if (bottom != null) bottom
          ])),
    );
  }

  /*
   kToolbarHeight = 56.0, you override the max and min extent with the height of a
   normal toolBar plus the height of the tabBar.preferredSize
   so you can fit your row and your tabBar, you give them the same value so it
   shouldn't shrink when scrolling
  */

  @override
  double get maxExtent =>
      kToolbarHeight +
      bottom.preferredSize.height +
      MediaQuery.of(context).size.height * 0.07;

  @override
  double get minExtent =>
      kToolbarHeight +
      bottom.preferredSize.height +
      MediaQuery.of(context).size.height * 0.07;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
