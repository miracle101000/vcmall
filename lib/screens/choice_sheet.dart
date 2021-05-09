import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/order.dart';
import 'package:vc_mall/screens/measurements.dart';
import 'package:vc_mall/screens/payment_confrimation.dart';

class ChoiceSheet extends StatefulWidget {
  String function;
  Product product;

  ChoiceSheet(this.function,this.product);

  @override
  _ChoiceSheetState createState() => _ChoiceSheetState();
}

class _ChoiceSheetState extends State<ChoiceSheet> {
  int currentPrice = 0;
  int numberOfItems = 1;
  int some;
  var finalPrice = 0;
  var finalQuantity = 1;


//For demonstrate purpose I have added five static items
  @override
  void initState() {
    some = widget.product.price * (100 - widget.product.discount) ~/ 100;
    finalPrice = some;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//      height: MediaQuery.of(context).size.height * 0.8,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 8, right: 10, left: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: FittedBox(
                  child: Image.network(widget.product.imageUrl[0]),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₦${currentPrice == 0 ? some : currentPrice}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text('200 units in stock'),
                  Text('Please make your choice'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
//                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Check your measurement',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text('Measurement ',
                        style: TextStyle(fontSize: 16, color: Colors.blue)),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.blue,
                    )
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Measurement.routeName);
                },
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
//            height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Colors',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          color: Colors.blue,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sizes',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          color: Colors.blue,
                        ),
                      ),
                      Divider(color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Special Services',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
//                        Text('Quantity',
//                            style:
//                                TextStyle(fontSize: 16, color: Colors.black)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _decrementButton(),
                                  Text(
                                    '$numberOfItems',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  _incrementButton(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Container(
          color: widget.function == 'Buy Now' ? Colors.black : Colors.white,
          child: FlatButton(
//          focusColor: Colors.white,
//          highlightColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Text(
                  widget.function,
                  style: TextStyle(
                      color: widget.function == 'Buy Now'
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ConfirmPayment.routeName,arguments:Order(widget.product.title,widget.product.imageUrl[0],finalPrice,finalQuantity));

            },
          ),
        ),
      ),
    );
  }

  Widget _incrementButton() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(),
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {
          numberOfItems = numberOfItems + 1;
          currentPrice = some * numberOfItems;
          finalPrice = currentPrice;
          finalQuantity = numberOfItems;
          print(currentPrice);
        });
      },
    );
  }

  Widget _decrementButton() {
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            if (numberOfItems == 1) {
              return null;
            }
            numberOfItems = numberOfItems - 1;
            currentPrice = currentPrice - some;
            finalQuantity = numberOfItems;
            finalPrice = currentPrice;
          });
        },
        child: Center(
            child: Text(
          '-',
          style: TextStyle(color: Colors.black, fontSize: 30),
        )),
        backgroundColor: Colors.white);
  }
}
