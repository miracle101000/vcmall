import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';
import 'package:vc_mall/widgets/product_item.dart';

import 'filter_screen.dart';

// ignore: must_be_immutable
class ProductsGrid extends StatefulWidget {
  String name;
  String selectedChoice;
  bool isReset;
  bool isFilter;
  int isSelected;
  String startValue;
  String endValue;

  bool subsubCategoryisSelected;

  List<Product> someList;

  ProductsGrid(
      {this.name,
      this.selectedChoice,
      this.isSelected,
      this.isFilter,
      this.isReset,
      this.startValue,
      this.endValue,
      this.subsubCategoryisSelected,
      this.someList});

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget query = Text(' Popularity');
  List<String> brands = ['None'];
  List<String> gender = ['None'];
  List<String> system = [];

  // ignore: top_level_instance_method
  var rating, discount;

  List<Product> ratingOutput,
      discountOutput,
      brandOutput,
      genderOutput,
      colorOutput,
      systemOutput,
      sizeOutput,
      priceOutput,
      percentOutput;

  @override
  void initState() {
    ratingOutput = widget.someList;
    discountOutput = widget.someList;
    brandOutput = widget.someList;
    genderOutput = widget.someList;
    colorOutput = widget.someList;
    systemOutput = widget.someList;
    percentOutput = widget.someList;
    sizeOutput = widget.someList;
    priceOutput = widget.someList;

    super.initState();
  }

  bool toListView = false;
  bool _isDiscount = false;
  bool _isRate = false;
  bool _isBrand = false;
  bool _isGender = false;
  bool _isColor = false;
  bool _isSystem = false;
  bool _isSize = false;
  bool _centValue = false;
  bool _priceValue = false;
  String starValue = '0';
  String enValue = '0';

  set r(List<Product> value) => setState(() => ratingOutput = value);

  set rbool(bool value) => setState(() => _isRate = value);

  set d(List<Product> value) => setState(() => discountOutput = value);

  set dbool(bool value) => setState(() => _isDiscount = value);

  set b(List<Product> value) => setState(() => brandOutput = value);

  set bbool(bool value) => setState(() => _isBrand = value);

  set g(List<Product> value) => setState(() => genderOutput = value);

  set gbool(bool value) => setState(() => _isGender = value);

  set c(List<Product> value) => setState(() => colorOutput = value);

  set cbool(bool value) => setState(() => _isColor = value);

  set s(List<Product> value) => setState(() => systemOutput = value);

  set sbool(bool value) => setState(() => _isSystem = value);

  set sz(List<Product> value) => setState(() => sizeOutput = value);

  set szbool(bool value) => setState(() => _isSize = value);

  set sv(String value) => setState(() => starValue = value);

  set ev(String value) => setState(() => enValue = value);

  set mc(List<Product> value) => setState(() => percentOutput = value);

  set mcbool(bool value) => setState(() => _centValue = value);

  set pri(List<Product> value) => setState(() => priceOutput = value);

  @override
  Widget build(BuildContext context) {
    widget.isReset = false;

    final products = Provider.of<Products>(context)
        .findBySubCategoryName(widget.name, widget.selectedChoice);

    for (int i = 0; i < products.length; i++) {
      brands.add(products[i].brand);
    }

    for (int i = 0; i < products.length; i++) {
      system.add(products[i].osystem);
    }

    var filter = _isRate == true &&
            _isDiscount == true &&
            _isBrand == true &&
            _isGender == true &&
            _isColor == true &&
            _isSystem == true &&
            _isSize == true &&
            _centValue == true
        ? widget.someList
        : ratingOutput
            .toSet()
            .intersection(discountOutput.toSet().intersection(brandOutput
                .toSet()
                .intersection(genderOutput.toSet().intersection(colorOutput
                    .toSet()
                    .intersection(systemOutput.toSet().intersection(
                        percentOutput.toSet().intersection(sizeOutput
                            .toSet()
                            .intersection(priceOutput.toSet()))))))))
            .toList();
    var same = widget.selectedChoice == 'All'
        ? filter
        : filter
            .where((element) => element.subsubCategory == widget.selectedChoice)
            .toList();

    for (int i = 0; i < filter.length; i++) {
      gender.add(filter[i].gender);
    }

    var subsubCategory = same;

    List<Product> product = subsubCategory;

    return Scaffold(
      key: scaffoldKey,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: new Drawer(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF9F9F9),
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 33,
                elevation: 0,
                backgroundColor: Color(0xFFF9F9F9),
                leading: IconButton(
                  tooltip: 'Close',
                  icon: Icon(Icons.close),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 32.0),
                    child: GestureDetector(
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Provider.of<Products>(context, listen: false)
                            .sortByRating(99.0);
                        Provider.of<Products>(context, listen: false)
                            .sortByDiscount(999);
                        Provider.of<Products>(context, listen: false)
                            .sortByBrand('None');
                        Provider.of<Products>(context, listen: false)
                            .sortByGender('None');
                        Provider.of<Products>(context, listen: false)
                            .sortByColor('None');
                        Provider.of<Products>(context, listen: false)
                            .sortBySystem('None');
                        Provider.of<Products>(context, listen: false)
                            .sortBySizes('None');
                        Provider.of<Products>(context, listen: false)
                            .sortByPercent(0.0);
                        ratingOutput = widget.someList;
                        discountOutput = widget.someList;
                        brandOutput = widget.someList;
                        genderOutput = widget.someList;
                        colorOutput = widget.someList;
                        systemOutput = widget.someList;
                        percentOutput = widget.someList;
                        sizeOutput = widget.someList;
                        priceOutput = widget.someList;
                        widget.startValue = '0';
                        widget.endValue = '0';
                        _isSystem = true;
                        _isColor = true;
                        _isGender = true;
                        _isDiscount = true;
                        _isBrand = true;
                        _isRate = true;
                        _centValue = true;
                        _priceValue = true;
                        widget.isReset = true;
                      },
                    ),
                  )
                ],
              ),
              body: Container(
                  child: FilterScreen(
                      name: widget.name,
                      brands: brands.toSet().toList(),
                      products: products,
                      selectedChoice: widget.selectedChoice,

                      ///For rate
                      rcallback: (val) => setState(() => ratingOutput = val),
                      rboolcallback: (val) => setState(() => _isRate = val),

                      ///For discount
                      dboolcallback: (val) => setState(() => _isDiscount = val),
                      dcallback: (val) => setState(() => discountOutput = val),

                      ///For brand
                      bboolcallback: (val) => setState(() => _isBrand = val),
                      bcallback: (val) => setState(() => brandOutput = val),

                      ///For gender
                      gboolcallback: (val) => setState(() => _isGender = val),
                      gcallback: (val) => setState(() => genderOutput = val),

                      ///For color
                      cboolcallback: (val) => setState(() => _isColor = val),
                      ccallback: (val) => setState(() => colorOutput = val),

                      ///For system
                      sboolcallback: (val) => setState(() => _isSystem = val),
                      scallback: (val) => setState(() => systemOutput = val),
                      system: system.toSet().toList(),

                      ///For size
                      szboolcallback: (val) => setState(() => _isSize = val),
                      szcallback: (val) => setState(() => sizeOutput = val),

                      ///For merchant rating
                      pboolcallback: (val) => setState(() => _centValue = val),
                      pcallback: (val) => setState(() => percentOutput = val),

                      ///For price
                      startOutput: (val) =>
                          setState(() => widget.startValue = val),
                      endOutput: (val) => setState(() => widget.endValue = val),
                      startValue:
                          widget.startValue == ' ' ? '0' : widget.startValue,
                      endValue: widget.endValue == ' ' ? '0' : widget.endValue,
                      product: products,
                      isReset: widget.isReset,
                      gender: gender.toSet().toList(),
                      subsubCategoryisSelected:
                          widget.subsubCategoryisSelected)),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text(
                    widget.startValue != '0' &&
                            widget.endValue != '0' &&
                            widget.startValue == ' ' &&
                            widget.endValue == ' '
                        ? 'Save to see results'
                        : 'Filtered Results (${product.length})',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      final st = widget.startValue;
                      final en = widget.endValue;
                      final start =
                          int.parse(int.parse(st) > int.parse(en) ? en : st);
                      final end =
                          int.parse(int.parse(st) > int.parse(en) ? st : en);
                      priceOutput = start == 0 && end == 0
                          ? widget.someList
                          : products
                              .where((element) =>
                                  (element.price *
                                          (100 - element.discount) ~/
                                          100) >=
                                      start &&
                                  (element.price *
                                          (100 - element.discount) ~/
                                          100) <=
                                      end)
                              .toList(growable: true);
                    });
                  },
                ),
              ),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: new Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: toListView ? Icon(Icons.table_rows_outlined) : Icon(Icons.grid_on),
                  onPressed: () {
                    setState(() {
                      toListView = !toListView;
                    });

                  },
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: query,
                          onTap: () {
                            showBottomShee(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            onPressed: () {
                              showBottomShee(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.11,
                    ),
                    GestureDetector(
                      child: Text(
                        '   Filter',
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        scaffoldKey.currentState.openEndDrawer();
                        widget.isFilter = true;
                        widget.isReset = false;
                        widget.startValue = '0';
                        widget.endValue = '0';
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.filter_list_outlined),
                        color: Colors.black,
                        onPressed: () {
                          scaffoldKey.currentState.openEndDrawer();
                          widget.isFilter = true;
                          widget.isReset = false;
                          widget.startValue = '0';
                          widget.endValue = '0';
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Expanded(
              child: toListView ? ListView.builder(
                  itemCount: products == null ? 0 : product.length,
                  itemBuilder: (context,index){
                return ChangeNotifierProvider.value(
                  value: product[index],
                  child: ProductsItem(toListView),
                );
              }): GridView.builder(
                itemCount: products == null ? 0 : product.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 10.0 / 17.0,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ChangeNotifierProvider.value(
                    value: product[index],
                    child: ProductsItem(toListView),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  var children = [
    Text('Popularity'),
    Text('New'),
    Text('Best Rating'),
    Text('Lowest Price'),
    Text('Highest Price')
  ];

  void showBottomShee(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: CupertinoPicker(
              itemExtent: 25,
              onSelectedItemChanged: (int value) {
                setState(() {
                  query = children[value];
                });
              },
              children: children,
            ),
          );
        });
//
  }
}
