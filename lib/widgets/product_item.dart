import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/screens/product_detail_screen.dart';

class ProductsItem extends StatefulWidget {
  bool toListView;

  ProductsItem(this.toListView);

  @override
  _ProductsItemState createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    var width1 = MediaQuery.of(context).size.width * 0.27;
    double padding = 8;
    TextAlign textAlign = TextAlign.left;
    return widget.toListView == true
        ? GestureDetector(
          child: Card(
      elevation: 0,
              child: Row(
                children: [
                  Container(
                    height: 120,
                    child: AspectRatio(
                      aspectRatio: 18.0 / 16.0,
                      child: ParallaxImage(
                        image: NetworkImage(
                          product.imageUrl[0],
                        ),
                        extent: 150.0,
//                  controller: _controller,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            textAlign: textAlign,
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                product.discount == 0
                                    ? '₦${product.price}'
                                    : '₦${(product.price * (100 - product.discount)) ~/ 100}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (product.discount != 0)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '₦${product.price}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey),
                                  ),
                                ),
                              if (product.discount != 0)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '-${product.discount}%',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            color: Colors.orange,
                            child: Text(
                              'New',
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: StarRating(
                            size: 20.0,
                            rating: product.rating,
                            color: Colors.orange,
                            starCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Consumer<Product>(
                          builder: (ctx, product, _) => IconButton(
                            icon: product.isFavorite == false
                                ? Icon(Icons.favorite_border)
                                : Icon(Icons.favorite),
                            onPressed: () {
                              setState(() {
                                product.toggleFavoriteStatus();
                              });
                            },
                            color: Colors.redAccent,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {},
                          color: Colors.blue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
      onTap: (){
        Navigator.pushNamed(
            context, ProductDetailScreen.routeName,arguments: product);
      },
        )
        : Card(
      elevation: 0,
          child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      GestureDetector(
                        child: AspectRatio(
                          aspectRatio: 18.0 / 16,
                          child: Card(
                            elevation: 0,
                            child: ParallaxImage(
                              image: NetworkImage(
                                product.imageUrl[0],
                              ),
                              extent: 150.0,
//                  controller: _controller,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductDetailScreen.routeName,arguments: product);
                        },
                      ),
                      Consumer<Product>(
                        builder: (ctx, product, _) => IconButton(
                          icon: product.isFavorite == false
                              ? Icon(Icons.favorite_border)
                              : Icon(Icons.favorite),
                          onPressed: () {
                            setState(() {
                              product.toggleFavoriteStatus();
                            });
                          },
                          color: Colors.redAccent,
                        ),
                      )
                    ]),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(padding),
                            width: width1 + 100,
//                  height: height,
                            child: Text(
                              product.title,
                              textAlign: textAlign,
                              style: TextStyle(color: Colors.black, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      product.discount == 0
                                          ? '₦${product.price}'
                                          : '₦${(product.price * (100 - product.discount)) ~/ 100}',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      color: Colors.orange,
                                      child: Text(
                                        'New',
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.shopping_cart),
                                  onPressed: () {},
                                  color: Colors.blue,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              if (product.discount != 0)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '₦${product.price}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey),
                                  ),
                                ),
                              if (product.discount != 0)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '-${product.discount}%',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: StarRating(
                                    size: 20.0,
                                    rating: product.rating,
                                    color: Colors.orange,
                                    starCount: 5,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
        );
  }
}
