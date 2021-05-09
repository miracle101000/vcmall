import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/filter_objects/rating_object.dart';
import 'package:vc_mall/providers/products.dart';
import 'package:vc_mall/screens/products_view_screen.dart';
import 'package:vc_mall/config/route.dart';
import 'package:vc_mall/widgets/tabs_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: MultiProvider(
        providers:[ ChangeNotifierProvider(
         create: (ctx) =>Products()),
      ],
          child: new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,

            ),
            home: TabsPage(),
            onGenerateRoute: Routes.generateRoute,
            initialRoute: '/' ,
          ),
        ),
    );

  }
}


