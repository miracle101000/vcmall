import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/screens/products_view_screen.dart';

// ignore: must_be_immutable
class Test extends StatelessWidget {
  Map categories;

  Test(this.categories);



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    TextAlign textAlign = TextAlign.left;
//    print(categories[categories.keys.toList()[0]]
//    [0]);
    return Container(
      height: height * categories.length / 2.5,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.keys.length,
          itemBuilder: (context, i) {
            return Container(
//              constraints: BoxConstraints(minHeight: 100,maxHeight: double.infinity),
              height: height *
                  0.085 *
                  categories[categories.keys.toList()[i]].length,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categories.keys.toList()[i],
                        textAlign: textAlign,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          child: Text(
                            'SEE ALL',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductsViewScreen.routeName,
                                arguments: categories.keys.toList()[i]);
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(),
//                        SizedBox(height: 5),
                  Expanded(
                    child: Container(
//                        height: 30.0 *
//                            categories[categories.keys.toList()[i]].length,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            categories[categories.keys.toList()[i]].length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 2,
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: categories[categories.keys.toList()[i]]
                                [index],
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductsViewScreen.routeName,
                                  arguments:
                                      categories[categories.keys.toList()[i]]
                                              [index]
                                          .getText());
                            },
                          );
                        },
                      ),
                    ),
                  ),
//                        SizedBox(
//                          height: 15,
//                        )
                ],
              ),
            );
          }),
    );
  }
}
