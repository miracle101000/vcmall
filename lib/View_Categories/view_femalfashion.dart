import 'package:flutter/material.dart';
import 'package:vc_mall/Category/list.dart';
import 'package:vc_mall/screens/test.dart';


class ViewFemale extends StatelessWidget {
  Color colors = Colors.white;

  ViewFemale(this.colors);

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
