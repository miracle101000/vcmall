import 'package:flutter/material.dart';
import 'package:vc_mall/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Malta Guinness',
        price: 4390,
        brand: 'Amstel',
//        sizes: ['small bottles','Big Bottles','can'],
        category: 'Home & Office',
        subCategory: 'Home & Kitchen',
        subsubCategory: 'Bath',
        sellerRating: 0.3,
        discount: 0,
        videoUrl: 'assets/images/products/intro.mp4',
        imageUrl: [
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        ],
        isFavorite: true,
        rating: 2.5),
    Product(
      id: 'p2',
      title: 'Trousers',
      price: 3500,
      discount: 10,
      category: 'Men\'s Fashion',
      subCategory: 'Food Cupboard',
      subsubCategory: 'Belts',
      sellerRating: 0.5,
      brand: 'Hermes',
      sizes: ['12 inches', '14 inches', '17 inches'],
      size: '12 inches',
      imageUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'
      ],
      videoUrl:'assets/images/products/intro.mp4',
      isFavorite: true,
      rating: 4.5,
    ),
    Product(
      id: 'p2',
      title: 'Tr',
      price: 3500,
      discount: 36,
      category: 'Men\'s Fashion',
      subCategory: 'Food Cupboard',
      subsubCategory: 'Belts',
      sellerRating: 0.45,
      brand: 'Hermes',
      color: 'Red',
      sizes: ['12 inches', '14 inches', '17 inches'],
      size: '17 inches',
      imageUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'
      ],
      videoUrl: 'assets/images/products/intro.mp4',
      isFavorite: true,
      rating: 3.0,
    ),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        price: 1980,
        discount: 20,
        category: 'Women\'s Fashion',
        color: 'Blue',
        subsubCategory: 'Women\'s Accessories',
        subCategory: 'Food Cupboard',
        sellerRating: 0.85,
        brand: 'Gold',
        sizes: ['S', 'L', 'XL', 'XXL'],
        size: 'XL',
        imageUrl: [
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        ],
        videoUrl: 'assets/images/products/intro.mp4',
        isFavorite: true,
        rating: 1.5),
    Product(
        id: 'p4',
        title: 'Math',
        brand: 'Mama Gold',
        color: 'Blue',
        sizes: ['10 kg', '20 kg', '40 kg'],
        size: '40 kg',
        category: 'Supermarket',
        subCategory: 'Food Cupboard',
        discount: 0,
        subsubCategory: 'Grains & Rice',
        sellerRating: 1.0,
        price: 4900,
        imageUrl: [
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg'
        ],
        videoUrl: 'assets/images/products/intro.mp4',
        rating: 3.0),
    Product(
        id: 'p4',
        title: 'Maths',
        brand: 'Mama Gold',
        sizes: ['10 kg', '20 kg', '40 kg'],
        size: '20 kg',
        category: 'Supermarket',
        subCategory: 'Food Cupboard',
        subsubCategory: 'Grains & Rice',
        sellerRating: 0.67,
        discount: 0,
        price: 4900,
        imageUrl: [
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg'
        ],
//        videoUrl: 'assets/images/products/intro.mp4',
        rating: 3.0),
    Product(
        id: 'p4',
        title: 'Rice',
        brand: 'Mama Gold',
        sizes: ['10 kg', '20 kg', '40 kg'],
        size: '10 kg',
        category: 'Supermarket',
        subCategory: 'Food Cupboard',
        subsubCategory: 'Grains & Rice',
        discount: 60,
        sellerRating: 0.58,
        price: 4900,
        imageUrl: [
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg'
        ],
        videoUrl: 'assets/images/products/intro.mp4',
        rating: 4.5),
    Product(
        id: 'p4',
        title: 'Rice',
        brand: 'Mama Gold',
        sizes: ['10 kg', '20 kg', '40 kg'],
        size: '10 kg',
        category: 'Supermarket',
        subCategory: 'Food Cupboard',
        subsubCategory: 'Grains & Rice',
        discount: 65,
        sellerRating: 0.58,
        price: 4900,
        imageUrl: [
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg'
        ],
        videoUrl: 'assets/images/products/intro.mp4',
        rating: 4.5),
  ];

  double rating = 99.0;

  int discount = 0;

  String gender = 'None';

  String system = 'None';

  String brand = 'None';

  String size = 'None';

  double cent = 0.0;

  String startValue = '0';
  String endValue = '0';

  String color = 'None';

  List<Product> get items {
    return [..._items];
  }

  void sortByRating(dynamic rate) {
    rating = rate;
    notifyListeners();
  }

  void sortByDiscount(discounted) {
    discount = discounted;
    notifyListeners();
  }

  void sortBySizes(sized) {
    size = sized;
    notifyListeners();
  }

  void sortByBrand(branded) {
    brand = branded;
    notifyListeners();
  }

  void sortByGender(gendered) {
    gender = gendered;
    notifyListeners();
  }

  void sortByColor(colored) {
    color = colored;
    notifyListeners();
  }

  void sortBySystem(systems) {
    system = systems;
    notifyListeners();
  }

  void sortByPrice(String s, String t) {
    s = startValue;
    t = endValue;
    notifyListeners();
  }

  void sortByPercent(double cents) {
    cent = cents;
    notifyListeners();
  }

  double setRatings() {
    return rating;
  }

  String setBrands() {
    return brand;
  }

  String setGenders() {
    return gender;
  }

  String setSystem() {
    return system;
  }

  String setColor() {
    return color;
  }

  String setSizes() {
    return size;
  }

  String setStartValue() {
    return startValue;
  }

  String setEndValue() {
    return endValue;
  }

  int setDiscounts() {
    return discount;
  }

  double setPercents() {
    return cent;
  }

  List<Product> findBySubCategoryName([String name, String choice]) {
    return choice == 'All' || choice == null ? _items
        .where((element) =>
    element.subCategory == name)
        .toList() : _items
        .where((element) =>
            element.subCategory == name && element.subsubCategory == choice)
        .toList();
  }
}
