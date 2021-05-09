import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vc_mall/my_shop.dart';
import 'package:vc_mall/providers/order.dart';
import 'package:vc_mall/screens/address.dart';
import 'package:vc_mall/screens/filter_screen.dart';
import 'package:vc_mall/screens/measurements.dart';
import 'package:vc_mall/screens/payment_confrimation.dart';
import 'package:vc_mall/screens/product_detail_screen.dart';
import 'package:vc_mall/screens/products_view_screen.dart';
import 'package:vc_mall/screens/review.dart';
import 'package:vc_mall/screens/home_screen.dart';
import 'package:vc_mall/screens/seller_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen()) ;
      case ProductsViewScreen.routeName:
        var data = settings.arguments;
        return MaterialPageRoute(builder: (_) => ProductsViewScreen(data));
      case ProductDetailScreen.routeName:
        var data = settings.arguments;
        return MaterialPageRoute(builder: (_) => ProductDetailScreen(data));
      case Reviews.routeName:
        return MaterialPageRoute(builder: (_) => Reviews());
      case SellerScreen.routeName:
        return MaterialPageRoute(builder: (_) => SellerScreen());
      case Measurement.routeName:
        return MaterialPageRoute(builder: (_) => Measurement());
      case ConfirmPayment.routeName:
        Order order = settings.arguments;
        return MaterialPageRoute(builder: (_) => ConfirmPayment(order));
      case AddressPage.routeName:
        return MaterialPageRoute(builder: (_) => AddressPage());
      case MyShop.routeName:
        return MaterialPageRoute(builder: (_) => MyShop());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
