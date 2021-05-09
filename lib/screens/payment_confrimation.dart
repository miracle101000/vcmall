import 'package:flutter/material.dart';
import 'package:vc_mall/Category/list.dart';
import 'package:vc_mall/providers/order.dart';
import 'package:vc_mall/screens/address.dart';

class ConfirmPayment extends StatefulWidget {
  static const routeName = '/confirm_payment';
  Order order;
  ConfirmPayment(this.order);

  @override
  _ConfirmPaymentState createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  int initialPrice = 0;
  int numberOfItems = 1;
  int currentPrice = 0;

  @override
  void initState() {
    initialPrice = widget.order.price();
    numberOfItems = widget.order.quanity();
    currentPrice = initialPrice;
    initialPrice = initialPrice ~/ numberOfItems;

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Confirm Payment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'MIRACLE',
                                      style:
                                          TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    '19852954371',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Text(
                                        'Nanjing University oF Science and Technology Nanjing University oF Science and Technology'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Change your current address',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, AddressPage.routeName);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Company name'),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                margin:
                                    EdgeInsets.only(top: 8, right: 10, left: 8),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: FittedBox(
                                  child: Image.network(
                                      widget.order.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width: 150,
                                    child: Text(
                                      'Nanjing University oF Science and Technology Nanjing University oF Science and Technology',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    )),
//                                SizedBox(height: 20,),
                                Container(
                                  height: 50,
                                  child: Text(
                                    '${widget.order.itemName} && size',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 61.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '₦${currentPrice == 0 ? initialPrice : currentPrice}',
                                    maxLines: 3,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                height: 31.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('x$numberOfItems'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quantity'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                FlatButton(
                                  child: Text('-'),
                                  onPressed: () {
                                    setState(() {
                                      if (numberOfItems == 1) {
                                        return null;
                                      }
                                      numberOfItems = numberOfItems - 1;
                                      currentPrice =
                                          currentPrice - initialPrice;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('$numberOfItems'),
                                ),
                                FlatButton(
                                  child: Text('+'),
                                  onPressed: () {
                                    setState(() {
                                      numberOfItems = numberOfItems + 1;
                                      currentPrice =
                                          initialPrice * numberOfItems;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.radio_button_off,
                                  color: Colors.blue,
                                ),
                              ),
                              Text('Freight Insurance '),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('₦100 '),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('$numberOfItems pieces in total ',
                              style: TextStyle(color: Colors.grey)),
                          Text('subtotal:'),
                          Text(
                            ' ₦${currentPrice == 0 ? initialPrice + 100 : currentPrice + 100}',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.radio_button_off,
                    color: Colors.blue,
                  ),
                ),
                Text('Agree with Terms and Services'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total: '),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '₦${currentPrice == 0 ? initialPrice + 100 : currentPrice + 100}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                FlatButton(
                    shape: StadiumBorder(),
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text(
                      'Order',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
