import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';
import 'dart:math';

import 'package:vc_mall/screens/measurements.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);
// ignore: must_be_immutable
class GenderObject extends StatefulWidget {
  ListCallback callback;
  BoolCallback gboolcallback;
  String name;
  String selectedChoice;
  bool reset = false;



  GenderObject({this.name,this.selectedChoice,this.callback,this.gboolcallback,this.reset});

  @override
  _GenderObjectState createState() => _GenderObjectState();
}

class _GenderObjectState extends State<GenderObject> {
  var _expandedGender = false;
  int selectedIndex = 0;
  List<String> genders = ['None','Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    var gender = Provider.of<Products>(context, listen: false).setGenders();
    var products = Provider.of<Products>(context).findBySubCategoryName(widget.name,widget.selectedChoice);
    List<Product> genderOutput = [];
    int selectedIndex = genders.indexOf(gender);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon:
                  Icon(_expandedGender ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedGender = !_expandedGender;
                });
              },
            ),
          ],
        ),
        if (_expandedGender)
          Container(
              height: 50,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: genders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: ChoiceChip(
                          elevation: 5,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          selected: selectedIndex == index,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              genders[index],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          onSelected: (selected){
                            widget.reset = false;
                            selectedIndex =  index;
                            gender = genders[index];
                            var gend = gender == 'None' ?
                            products:
                            products
                                .where((element) =>
                            element.gender == gender)
                                .toList(growable: true);
                            for (int i = 0; i < gend.length; i++) {
                              genderOutput.add(gend[i]);
                            }
                            widget.gboolcallback(widget.reset);
                            widget.callback(genderOutput);
                            Provider.of<Products>(context, listen: false)
                                .sortByGender(gender);
                            print(genderOutput);
                          },
                        ),
                      );
                    }),
              )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
