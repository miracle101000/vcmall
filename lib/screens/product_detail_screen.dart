import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/screens/choice_sheet.dart';
import 'package:vc_mall/screens/products_view_screen.dart';
import 'package:vc_mall/screens/review.dart';
import 'package:vc_mall/screens/seller_screen.dart';
import 'package:vc_mall/widgets/search_field.dart';
import 'package:video_player/video_player.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = 'product-detail';

  Product product;

  ProductDetailScreen(this.product);

  VideoPlayerController videoPlayerController;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ChewieController chewieController;
  List<String> preview = [];
  List<StatefulWidget> view = [];

  @override
  void initState() {
    super.initState();
    preview.add(widget.product.videoUrl);
    for (int i = 0; i < widget.product.imageUrl.length; i++) {
      preview.add(widget.product.imageUrl[i]);
    }

    if (preview[0] != null) {
      chewieController = ChewieController(
          videoPlayerController: VideoPlayerController.asset(preview[0]),
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: false,
          materialProgressColors:
              ChewieProgressColors(bufferedColor: Colors.blue));
    }

    if (preview[0] != null) {
      view.add(Chewie(controller: chewieController));
      for (int i = 1; i < preview.length; i++) {
        view.add(Image(
          image: NetworkImage(
            preview[i],
          ),
          fit: BoxFit.fitWidth,
        ));
      }
    } else if (preview[0] == null) {
      view.clear();
      for (int i = 1; i < preview.length; i++) {
        view.add(Image(
          image: NetworkImage(
            preview[i],
          ),
          fit: BoxFit.fitWidth,
        ));
      }
    }
  }

  SwiperPagination _pagination = new SwiperPagination(
      alignment: Alignment.bottomRight,
      builder: DotSwiperPaginationBuilder(
          activeColor: Colors.blue, color: Colors.grey));

  @override
  void dispose() {
    // TODO: implement dispose
    if (preview[0] != null) {
      chewieController.dispose();
      chewieController.pause();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              floating: false,
              pinned: true,
//                title: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    SizedBox(width: MediaQuery.of(context).size.width * 0.105,),
//                    Center(child: Text('Details', style: TextStyle(color: Colors.black))),
//                  ],
//                ),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop(ProductsViewScreen.routeName);
                    });
                  }),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () => DataSearch()),
                IconButton(
                    icon: Icon(Icons.notifications_none), onPressed: () {})
              ],
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.black),
              expandedHeight: 370,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
//                    width: MediaQuery.of(context).size.width + 100,
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Swiper(
                        pagination: _pagination,
                        itemBuilder: (BuildContext context, int index) {
                          return AspectRatio(
                              aspectRatio: 3 / 2, child: view[index]);
                        },
                        duration: 2000,
                        itemCount: view.length,
                        viewportFraction: 1,
                        scale: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
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
                              '₦${(widget.product.price * (100 - widget.product.discount) ~/ 100)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(color: Colors.orange, child: Text('New'))
                        ],
                      ),
                      if (widget.product.discount != 0)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '₦${widget.product.price}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                color: Colors.blue,
                                child: Text(
                                  '-${widget.product.discount}%',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, left: 8.0),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(widget.product.title)),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {})
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                        child: Text('Brand: ${widget.product.brand}'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, left: 8.0),
                            child: StarRating(
                              size: 20.0,
                              rating: widget.product.rating,
                              color: Colors.orange,
                              starCount: 5,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 8.0),
                        child: Text(
                          '44 ratings',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(child: Text('Reviews(27) '))),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text('More'),
                                Icon(Icons.arrow_forward_ios_rounded)
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, Reviews.routeName);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  child: Container(
                      width: 100,
                      height: 200,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      stops: [
                                    0.1,
                                    0.1
                                  ],
                                      colors: [
                                    Colors.white.withOpacity(.8),
                                    Colors.blue.withOpacity(.1)
                                  ])),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.shopping_bag_outlined),
                                      Text(' Company name'),
                                    ],
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      '+ Follow',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SellerScreen.routeName,
                              );
                            },
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
//                                color: Colors.redAccent,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 160.0,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                height: 100,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ' N 700',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 160.0,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                height: 100,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ' N 700',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 160.0,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                height: 100,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ' N 700',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 160.0,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                height: 100,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ' N 700',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 160.0,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.black,
                                                height: 100,
                                                width: 150,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  ' N 700',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Container(
//                                    height: 100,
//                                      child: FlatButton(
//                                          onPressed: () {},
//                                          child: Text('More'))),
//                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Card(
                  elevation: 0,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 100,
                          height: 200,
                          child: Text(' Related Recommendations'))),
                ),
                Card(
                  elevation: 0,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 100,
                          height: 200,
                          child: Text('DESCRIPTION '))),
                ),
                Card(
                    elevation: 0,
                    child: Container(
                      height: 500,
                    )),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chat_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shop_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
//                        width: 120,
                            color: Colors.blue,
                            child: FlatButton(
                              onPressed: () {
                                if (preview[0] != null) {
                                  chewieController.pause();
                                }
                                showBottomShee(context, 'Add to cart');
                              },
                              child: Text(
                                'Add to cart ',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            )),
                      ),
                      Expanded(
                        child: Container(
//                        width: 120,
                            color: Colors.black,
                            child: FlatButton(
                                color: Colors.black,
                                onPressed: () {
                                  if (preview[0] != null) {
                                    chewieController.pause();
                                  }
                                  showBottomShee(context, 'Buy Now');
                                },
                                child: Text(
                                  'Buy now',
                                  style: TextStyle(color: Colors.white),
                                ))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showBottomShee(BuildContext context, String function) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ChoiceSheet(function, widget.product),
          );
        });
  }
}
