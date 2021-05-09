import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class ColorObject extends StatefulWidget {
  ListCallback callback;
  BoolCallback cboolcallback;
  String selectedChoice;
  String name;
  bool reset = false;

  ColorObject(
      {this.name,
      this.selectedChoice,
      this.callback,
      this.cboolcallback,
      this.reset});

  @override
  _ColorObjectState createState() => _ColorObjectState();
}

class _ColorObjectState extends State<ColorObject> {
  var _expandedColor = false;
  int selectedIndex = 0;

  List color = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.black,
    Colors.white
  ];
  List colorNames = [
    'None',
    'Red',
    'Orange',
    'Yellow',
    'Green',
    'Blue',
    'Indigo',
    'Purple',
    'Pink',
    'Black',
    'White'
  ];

  @override
  Widget build(BuildContext context) {

    var col = Provider.of<Products>(context, listen: false).setColor();
    int selectedIndex = colorNames.indexOf(col);
    List<Product> products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);
    List<Product> colorOutput = [];
    bool isSelected = selectedIndex == 10 ? true : false;
    print('color $isSelected');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Colors',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon:
                  Icon(_expandedColor ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedColor = !_expandedColor;
                });
              },
            ),
          ],
        ),
        if (_expandedColor)
          Container(
              height: min(colorNames.length.toDouble() * 20, 180),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: colorNames.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 5 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: ChoiceChip(
                          elevation: 5,
                          selectedColor: colorNames[index] == 'None' ? Colors.blue : color[index],
                          backgroundColor: Colors.blueGrey,
                          selected: selectedIndex == index,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              colorNames[index],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selectedIndex == 10 && colorNames[index] == 'White'
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              widget.reset = false;
                              selectedIndex = index;
                              col = colorNames[index];
                              var cal = col == 'None'? products :products
                                  .where((element) => element.color == col)
                                  .toList(growable: true);
                              for (int i = 0; i < cal.length; i++) {
                                colorOutput.add(cal[i]);
                              }
                              widget.cboolcallback(widget.reset);
                              widget.callback(colorOutput);
                              Provider.of<Products>(context, listen: false)
                                  .sortByColor(col);
                              print('s $cal');
                            });
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
