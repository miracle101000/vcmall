import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String title;
  String brand;
  int price;
  int discount;
  String gender;
  String osystem;
  String color;
  List<String> imageUrl;
  String videoUrl;
  List<String> sizes;
  String size;
  var category;
  var subCategory;
  double sellerRating;
  String subsubCategory;
  bool isFavorite;
  double rating;

  int numberOfRatings;

  String promotions;



  Product(
      {@required this.id,
      @required this.title,
      @required this.brand,
      @required this.price,
      @required this.imageUrl,
      @required this.category,
      @required this.subCategory,
      @required this.sellerRating,
      this.osystem,
      this.color,
      this.gender,
      this.discount = 0,
      this.videoUrl,
      this.sizes,
      this.size,
      this.numberOfRatings = 0,
      this.promotions,
      this.isFavorite = false,
      this.rating = 0,
      this.subsubCategory});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
