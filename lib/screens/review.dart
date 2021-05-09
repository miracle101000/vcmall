import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class Reviews extends StatelessWidget {
  static const routeName = '/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Product Reviews' ,style: TextStyle(color: Colors.black),),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      //It will return a listviewbuilder
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  Container(
            height:368,
            child: Card(
              elevation: 0,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Column(
                          children: [
                            Text('T8237782e'),
                            StarRating(
                              size: 10.0,
                              rating: 3.5,
                              color: Colors.blue,
                              starCount: 6,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            'The product is really Not That bad but he needs to work on his delivery')),
                    Container(
                      height: 200,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio: 3/2,
                      children: List.generate(6, (index) {
                        return Container(
                          child: Card(
                            elevation: 0,
                            color: Colors.blue,
                          ),
                        );
                      }),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2020-09-16'),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up_alt_outlined),
                                onPressed: () {},
                              ),
                              Text('5'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
