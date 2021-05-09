import 'package:flutter/material.dart';
import 'package:vc_mall/screens/test.dart';
import '../Category/list.dart';

class View extends StatelessWidget {
//  Color colors = Colors.white;
//
//  View(this.colors);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Test(c),
         ),
    );
  }
}
