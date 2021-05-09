import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  static const routeName = '/address-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text('My Addresses',style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'MIRACLE',
                            style: TextStyle(fontWeight: FontWeight.w700),
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
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                              'Nanjing University oF Science and Technology Nanjing University oF Science and Technology'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Icon(Icons.edit,color: Colors.grey,)
            ],

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),backgroundColor: Colors.blue,
      onPressed: (){},),
    );
  }
}
