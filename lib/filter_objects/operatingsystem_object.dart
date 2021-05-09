import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

class OperatingSystemObject extends StatefulWidget {
  ListCallback callback;
  BoolCallback sboolcallback;
  String selectedChoice;
  String name;
  bool reset = false;
  bool setSystem = false;

  OperatingSystemObject({
    this.name,
    this.selectedChoice,
    this.callback,
    this.sboolcallback,
    this.reset,
  });

  @override
  _OperatingSystemObjectState createState() => _OperatingSystemObjectState();
}

class _OperatingSystemObjectState extends State<OperatingSystemObject> {
  var _expandedSystem = false;
  int selectedIndex = 0;

  List systems = ['None', 'iOS', 'Android', 'Linux', 'ChromeOS', 'Windows'];

  @override
  Widget build(BuildContext context) {
    var system = Provider.of<Products>(context, listen: false).setSystem();
    var products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);
    int selectedIndex = systems.indexOf(system);
    List<Product> systemOutput = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Operating System',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(
                    _expandedSystem ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expandedSystem = !_expandedSystem;
                  });
                },
              ),
            )
          ],
        ),
        if (_expandedSystem)
          Container(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: systems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ChoiceChip(
                          elevation: 5,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          selected: selectedIndex == index,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${systems[index]}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              widget.reset = false;
                              selectedIndex = index;
                              system = systems[index];
                              var sys = system == 'None'
                                  ? products
                                  : products
                                      .where((element) =>
                                          element.osystem == system)
                                      .toList(growable: true);
                              for (int i = 0; i < sys.length; i++) {
                                systemOutput.add(sys[i]);
                              }
                              widget.sboolcallback(widget.reset);
                              widget.callback(systemOutput);
                              Provider.of<Products>(context, listen: false)
                                  .sortBySystem(system);
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
