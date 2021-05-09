import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void ListCallback(List<Product> val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class RatingObject extends StatefulWidget {
  double ratings;
  String name;
  String selectedChoice;
  bool isFilter;
  BoolCallback rboolcallback;
  ListCallback callback;
  bool reset = false ;

  RatingObject({this.name, this.selectedChoice, this.callback, this.rboolcallback, this.reset});

  bool setRating = false;

  @override
  _RatingObjectState createState() => _RatingObjectState();
}

class _RatingObjectState extends State<RatingObject> {
  var _expandedRating = false;

  final starCount = 5;

  final List<double> ratings = [
    99.0,
    0.0,
    0.5,
    1.0,
    1.5,
    2.0,
    2.5,
    3.0,
    3.5,
    4.0,
    4.5,
    5.0
  ];

  @override
  Widget build(BuildContext context) {
    var rate = Provider.of<Products>(context, listen: false).setRatings();
    var products = Provider.of<Products>(context).findBySubCategoryName(widget.name,widget.selectedChoice);
    List<Product> ratingOutput = [];
    int selectedIndex = ratings.indexOf(rate);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 8.0),
            child: Text(
              'Rating',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 8.0),
            child: IconButton(
              icon:
                  Icon(_expandedRating ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedRating = !_expandedRating;
                });
              },
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StarRating(
              size: 20.0,
              rating: rate == 99.0 ? 0.0 : rate,
              color: Colors.orange,
              starCount: starCount,
              onRatingChanged: (ratings) {
                setState(() {
                  rate = ratings;
                  widget.isFilter = true;
                });
              },
            ),
          ],
        ),
      ),
      if (_expandedRating)
        Container(
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ratings.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: ChoiceChip(
                          elevation: 5,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.blueGrey,
                          selected: ratings[selectedIndex] == ratings[index],
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                '${ratings[index] == 99.0 ? 'None' : ratings[index]}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              widget.reset = false;
                              selectedIndex = index;
                              rate = ratings[index];
                              var rat = rate == 99.0 ? products :
                                  products
                                      .where((element) =>
                                          element.rating == rate)
                                      .toList(growable: true);
                              for (int i = 0; i < rat.length; i++) {
                                ratingOutput.add(rat[i]);
                              }
                              widget.rboolcallback(widget.reset);
                              widget.callback(ratingOutput);
                              Provider.of<Products>(context, listen: false)
                                  .sortByRating(ratings[index]);
                            });
                          },
                        ),
                      );
                    }),
              ),
            )),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Divider(
          color: Colors.grey,
        ),
      ),
    ]);
  }
//  void callSetState(){
//    setState(() {
//      widget.setRating = true;
//    });
//  }

}
