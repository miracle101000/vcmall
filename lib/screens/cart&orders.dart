import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartsOrders extends StatefulWidget {
  @override
  _CartsOrdersState createState() => _CartsOrdersState();
}

class _CartsOrdersState extends State<CartsOrders>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:  SystemUiOverlayStyle.dark,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text('Bag',style: TextStyle(color: Colors.black),),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(child: Text('Cart Items',style: TextStyle(color: Colors.black),),),
                        Tab(child: Text('Order Items',style: TextStyle(color: Colors.black),),),
                      ],
                    ),
                    Container(
//                  height: 200,
                      child: Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Icon(Icons.directions_car),
                            Icon(Icons.directions_transit),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Things you may like'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.radio_button_off,color: Colors.grey,size: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('All',style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),

              Row(
                children: [
                  Text('Total: '),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('₦1300',style: TextStyle(color: Colors.blue,fontSize: 20)),
                  ),
                  FlatButton(
                    shape: StadiumBorder(),
                    color: Colors.blue,
                    child: Text('3 Items',style: TextStyle(color: Colors.white),),onPressed: (){},
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}
