import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vc_mall/widgets/my_header.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SellerScreen extends StatefulWidget {
  static const routeName = '/seller-screen';

  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  double progress = 0.8;

  currentProgressColor() {
    if (progress >= 0.5 && progress < 0.8) {
      return Colors.orange;
    }
    if (progress >= 0.8) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toInt());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            pinned: true,
//            snap: true,
            elevation: 0,
            expandedHeight: 320,
            flexibleSpace: Stack(
              children: [
                WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.blueAccent.withOpacity(0.8), Colors.blueAccent],
                      [Colors.white.withOpacity(0.5), Colors.blue],
                      [Colors.white, Colors.white],
                    ],
                    durations: [5000, 4300, 4800],
                    heightPercentages: [0.36, 0.4, 0.47],
//                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
//              heightPercentages: [0.25, 0.26, 0.28, 0.31],
                  backgroundImage: DecorationImage(
                    image: AssetImage('assets/images/products/clothing.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.srcOver),
                  ),
                  size: Size(
                    double.infinity,
                    double.infinity,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.50,
                          left: 8,
                          right: 16,
                          bottom: MediaQuery.of(context).size.height * 0.01),
//                  height: MediaQuery.of(context).size.height * 2.15,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Company name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '+ Follow',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ]),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.60,
                            left: 8,
                            right: 16,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Text('300 Followers')),
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.70,
                            left: 8,
                            right: 16,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Text('Successful 1k +')),
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.80,
                            left: 8,
                            right: 16,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Text('Quality Score 80%')),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.580,
                      left: MediaQuery.of(context).size.width * 0.60,
                      right: 16,
//                      bottom: MediaQuery.of(context).size.height * 0.01,
                      child: CircularPercentIndicator(
                        footer: new Text(
                          'Seller Score',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        center: Container(
                          alignment: Alignment(0, 0),
                          child: Text(
                            "${this.progress * 100}%",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        animationDuration: 200,
                        animateFromLastPercent: true,
//                        arcType: ArcType.FULL,
//                        arcBackgroundColor: Colors.black12,
                        backgroundColor: Colors.white,
                        progressColor: currentProgressColor(),
                        percent: progress,
                        animation: true,
                        radius: 75.0,
                        lineWidth: 5.0,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications_none),
                color: Colors.black,
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
          SliverPersistentHeader(
            floating: true,
            delegate: MyHeader(
                top: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text('He is the end time Apostle and an expositor of the Bible. He is'
                      ' deeply committed to a cause - Vision, Passion, and Destiny. A prolific and international acclaimed writer.'),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.blue,
                  controller: _tabController,
                  tabs: [
                    Container(
                        width: (MediaQuery.of(context).size.width - 100) / 3,
                        child: Center(
                            child: Text(
                          'All',
                          style: TextStyle(color: Colors.blue),
                        ))),
                    Container(
                      width: (MediaQuery.of(context).size.width - 100) / 3,
                      child: Tab(
                        icon: Text('New',
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 100) / 3,
                      child: Tab(
                          icon: Center(
                              child: Text('Discounts',
                                  style: TextStyle(color: Colors.blue)))),
                    ),
                  ],
                ),
                context: context),
            pinned: true,
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Center(child: Text("Tab one")),
                Center(child: Text("Tab two")),
                Center(child: Text("Tab three")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
