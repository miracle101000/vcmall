import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class BrandObject extends StatefulWidget {
  ListCallback callback;
  BoolCallback bboolcallback;
  String selectedChoice;
  String name;
  bool reset = false;
  List<String> brands;

  BrandObject(
      {this.name,
      this.selectedChoice,
      this.callback,
      this.bboolcallback,
      this.reset,
      this.brands});

  @override
  _BrandObjectState createState() => _BrandObjectState();
}

class _BrandObjectState extends State<BrandObject> {
  var _expandedBrand = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var brand = Provider.of<Products>(context, listen: false).setBrands();
    var products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);
    List<Product> brandOutput = [];
    int selectedIndex = widget.brands.indexOf(brand);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Brands',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon:
                  Icon(_expandedBrand ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedBrand = !_expandedBrand;
                });
              },
            ),
          ],
        ),
        if (_expandedBrand)
          Container(
              height: min(
                  widget.brands.toSet().toList().length.toDouble() * 20, 180),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.brands.toSet().toList().length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 5 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: ChoiceChip(
                          tooltip: widget.brands.toSet().toList()[index],
                          elevation: 5,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          selected: selectedIndex == index,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                widget.brands[index],
                                style: TextStyle(
                                    fontSize: 10.7, color: Colors.white),
                              ),
                            ),
                          ),
                          onSelected: (selected) {
                            widget.reset = false;
                            selectedIndex = index;
                            brand = widget.brands[index];
                            var bran = brand == 'None'
                                ? products
                                : products
                                    .where((element) => element.brand == brand)
                                    .toList(growable: true);
                            for (int i = 0; i < bran.length; i++) {
                              brandOutput.add(bran[i]);
                            }
                            widget.bboolcallback(widget.reset);
                            widget.callback(brandOutput);
                            Provider.of<Products>(context, listen: false)
                                .sortByBrand(brand);
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
