import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/Category/list.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

class MerchantObject extends StatefulWidget {
  ListCallback callback;
  BoolCallback pboolcallback;
  String selectedChoice;
  String name;
  bool reset = false;

  MerchantObject(
      {this.name,
      this.selectedChoice,
      this.callback,
      this.pboolcallback,
      this.reset});

  bool setPercent = false;

  @override
  _MerchantObjectState createState() => _MerchantObjectState();
}

class _MerchantObjectState extends State<MerchantObject> {
  var _expandedMerchant = false;
  int selectedIndex = 0;

  List percent = [0.0, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

  List colors = [
    Colors.black,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orange,
    Colors.orange,
    Colors.lightGreenAccent,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    var cent = Provider.of<Products>(context, listen: false).setPercents();
    var products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);
    List<Product> percentOutput = [];
    int selectedIndex = percent.indexOf(cent);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Merchant Credibility Score',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(
                    _expandedMerchant ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expandedMerchant = !_expandedMerchant;
                  });
                },
              ),
            )
          ],
        ),
        if (_expandedMerchant)
          Container(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: percent.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ChoiceChip(
                          elevation: 5,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          selected: selectedIndex == index,
                          avatar: percent[index] == 0.0
                              ? null
                              : CircularPercentIndicator(
                                  center: Container(
                                    alignment: Alignment(0, 0),
                                  ),
                                  animationDuration: 200,
                                  animateFromLastPercent: true,
                                  backgroundColor: Colors.white,
                                  progressColor: colors[index],
                                  percent: percent[index],
                                  animation: true,
                                  radius: 25.0,
                                  lineWidth: 3.0,
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              percent[index] == 0.0
                                  ? 'None'
                                  : 'Up to ${(percent[index] * 100.0).toInt()}% and more',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              widget.reset = false;
                              selectedIndex = index;
                              cent = percent[index];
                              var cen = products
                                  .where((element) =>
                              element.sellerRating >= cent)
                                  .toList(growable: true);
                              for (int i = 0; i < cen.length; i++) {
                                percentOutput.add(cen[i]);
                              }
                              widget.pboolcallback(widget.reset);
                              widget.callback(percentOutput);
                              Provider.of<Products>(context, listen: false)
                                  .sortByPercent(cent);
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
