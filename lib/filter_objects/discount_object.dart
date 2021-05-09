import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class DiscountObject extends StatefulWidget {
  ListCallback callback;
  BoolCallback dboolcallback;
  String selectedChoice;
  String name;
  bool reset = false;

  DiscountObject({this.name, this.selectedChoice, this.callback, this.dboolcallback,
      this.reset});

  @override
  _DiscountObjectState createState() => _DiscountObjectState();
}

class _DiscountObjectState extends State<DiscountObject> {
  var _expandedDiscount = false;

  int selectedIndex = 0;
  List discounts = [999, 10, 20, 30, 40, 50, 60];

  @override
  Widget build(BuildContext context) {
    var discount = Provider.of<Products>(context, listen: false).setDiscounts();
    var products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);
    List<Product> discountOutput = [];
    int selectedIndex = discounts.indexOf(discount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Discount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(
                    _expandedDiscount ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expandedDiscount = !_expandedDiscount;
                  });
                },
              ),
            )
          ],
        ),
        if (_expandedDiscount)
          Container(
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: discounts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: ChoiceChip(
                        elevation: 5,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.blueGrey,
                        selected: selectedIndex == index,
                        onSelected: (selected) {
                          setState(() {
                            widget.reset = false;
                            selectedIndex = index;
                            discount = discounts[index];
                            var disc = discount == 999
                                ? products
                                : products
                                    .where((element) =>
                                        element.discount >= discount)
                                    .toList(growable: true);
                            for (int i = 0; i < disc.length; i++) {
                              discountOutput.add(disc[i]);
                            }
                            widget.dboolcallback(widget.reset);
                            widget.callback(discountOutput);
                            Provider.of<Products>(context, listen: false)
                                .sortByDiscount(discount);
                          });
                        },
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: discounts[index] == 999
                              ? Text(
                                  'None',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              : Text(
                                  '${discounts[index]}% Off & More',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
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
