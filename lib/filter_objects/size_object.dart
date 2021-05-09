import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';


typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class MeasurementObject extends StatefulWidget {
  String name;
  List<Product> products;
  String selectedChoice;
  bool subsubCategoryisSelected;
  ListCallback callback;
  BoolCallback szboolcallback;
  bool reset = false;
  bool setSize = false;

  MeasurementObject(
      {this.name,
      this.selectedChoice,
      this.products,
      this.subsubCategoryisSelected,
      this.callback,
      this.szboolcallback,
      this.reset});

  @override
  _MeasurementObjectState createState() => _MeasurementObjectState();
}

class _MeasurementObjectState extends State<MeasurementObject> {
  var _expandedSizes = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['None'];
    var item = widget.subsubCategoryisSelected == false
        ? widget.products
            .where((element) => element.subCategory == widget.name)
            .toList()
        : widget.products
            .where((element) => element.subsubCategory == widget.selectedChoice)
            .toList();
    for (int i = 0; i < item.length; i++) {
      for (int y = 0; y < item[i].sizes.length; y++) {
        sizes.add(item[i].sizes[y]);
      }
    }
    var products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);
    var size = Provider.of<Products>(context, listen: false).setSizes();
    int selectedIndex = sizes.toSet().toList().indexOf(size);
    List<Product> sizeOutput = [];

//    print('mmm${ widget.selectedChoice  == 'All'}  ${widget.selectedChoice}');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Measurement & Sizes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon:
                  Icon(_expandedSizes ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedSizes = !_expandedSizes;
                });
              },
            ),
          ],
        ),
        if (_expandedSizes)
          Container(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.toSet().toList().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: ChoiceChip(
                          tooltip: sizes.toSet().toList()[index],
                          elevation: 5,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          selected: selectedIndex == index,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              sizes.toSet().toList()[index],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          onSelected: (selected) {
                            widget.reset = false;
                            selectedIndex = index;
                            size = sizes.toSet().toList()[selectedIndex];
                            var siz = size == 'None'
                                ? products
                                : products
                                    .where((element) => element.size == size)
                                    .toList(growable: true);
                            for (int i = 0; i < siz.length; i++) {
                              sizeOutput.add(siz[i]);
                            }
                            widget.szboolcallback(widget.reset);
                            widget.callback(sizeOutput);
                            Provider.of<Products>(context, listen: false)
                                .sortBySizes(size);
//                            print('${size}');
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
