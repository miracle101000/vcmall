import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/providers/products.dart';
import 'package:vc_mall/screens/product_grid.dart';
import 'package:vc_mall/widgets/search_field.dart';



// ignore: must_be_immutable
class ProductsViewScreen extends StatefulWidget {
  String name;

  ProductsViewScreen(this.name);

  static const routeName = '/products-view';

  @override
  _ProductsViewScreenState createState() => _ProductsViewScreenState();
}

class _ProductsViewScreenState extends State<ProductsViewScreen> {
  Widget query = Text(' Popularity');
  String selectedChoice = 'All';
  List<String> selectedChoices = [];
  List<String> selectedItems = [];
  List<String> subsubCategory = ['All'];
  int selectedIndex = 0;
  String startValue = '0';
  String endValue =  '0';
  List<Widget> choices = List();
  var rating = 0.0;


  bool subsubCategoryisSelected =  false;
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    bool isReset = false;
    bool isFilter = false;

    var products = Provider.of<Products>(context, listen: false)
        .findBySubCategoryName(widget.name);

    for (int i = 0; i < products.length; i++) {
      subsubCategory.add(products.toList()[i].subsubCategory);
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F9F9),
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Provider.of<Products>(context, listen: false).sortByRating(99.0);
            Provider.of<Products>(context, listen: false).sortByDiscount(999);
            setState(() {
              isReset = true;
            });
          },
        ),
        actions: [
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
              if (subsubCategory.length != 1)
                Container(
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: subsubCategory.toSet().toList().length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RawChip(
                            elevation: 5,
                            selectedColor: Colors.blue,
                            checkmarkColor: Color(0xFFE5E5E5),
                            backgroundColor: Colors.blueGrey,
                            selected: selectedIndex == index,
                            avatar: CircleAvatar(
                              radius: 10,
                              backgroundColor: selectedIndex == index
                                  ? Colors.blueGrey
                                  : Color(0xFFE5E5E5),
                            ),
                            label: Text(
                              subsubCategory.toSet().toList()[index],
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (selected) {
                              setState(() {
                                selectedIndex = index;
                                selectedChoice =
                                    subsubCategory.toSet().toList()[index];
                                subsubCategoryisSelected = subsubCategory.toSet().toList()[index] == 'All' ? false :  true;
//                              Provider.of<Products>(context, listen: false)
//                                  .sortByRating(99.0);
//                              Provider.of<Products>(context, listen: false)
//                                  .sortByDiscount(999);
//                              Provider.of<Products>(context, listen: false)
//                                  .sortByBrand('None');
//                              Provider.of<Products>(context, listen: false)
//                                  .sortByGender('None');
////                              Provider.of<Products>(context, listen: false)
////                                  .sortByColor('None');
//                              Provider.of<Products>(context, listen: false)
//                                  .sortBySystem('None');
//                              Provider.of<Products>(context, listen: false)
//                                  .sortBySizes('None');
                                products = Provider.of<Products>(context, listen: false)
                                    .findBySubCategoryName(widget.name,selectedChoice);
                                isReset = true;
                                startValue = '0';
                                endValue = '0';
                              });
                            },
                          ),
                        );
                      }),
                ),
              Container(
                  child: Expanded(
                child: ProductsGrid(
                  name: widget.name,
                  selectedChoice: selectedChoice,
                  isSelected: selectedIndex,
                  isFilter: isFilter,
                  isReset: isReset,
                  startValue: startValue ,
                  endValue:  startValue,
                  someList: products ,
                  subsubCategoryisSelected : subsubCategoryisSelected
                ),
//                  child: ProductsGrid(
//                     name: widget.name, selectedChoice, selectedIndex,isFilter,isReset)
              )),
            ],
        ),
      ),
    );
  }

  void showBottomShee(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFFE5E5E5),
            height: MediaQuery.of(context).size.height / 5,
            child: CupertinoPicker(
              itemExtent: 20,
              onSelectedItemChanged: (int value) {
                setState(() {
                  query = children[value];
                });
              },
              children: children,
            ),
          );
        });
  }

  var children = [
    Text('Popularity'),
    Text('New'),
    Text('Best Rating'),
    Text('Lowest Price'),
    Text('Highest Price')
  ];
}
