import 'package:flutter/material.dart';

import 'package:vc_mall/filter_objects/brand_object.dart';
import 'package:vc_mall/filter_objects/color_object.dart';
import 'package:vc_mall/filter_objects/discount_object.dart';
import 'package:vc_mall/filter_objects/gender_object.dart';
import 'package:vc_mall/filter_objects/merchant_object.dart';
import 'package:vc_mall/filter_objects/operatingsystem_object.dart';
import 'package:vc_mall/filter_objects/price_object.dart';
import 'package:vc_mall/filter_objects/rating_object.dart';
import 'package:vc_mall/filter_objects/size_object.dart';
import 'package:vc_mall/models/product.dart';


typedef void ListCallback(List<Product> val);
typedef void StringCallback(String val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class FilterScreen extends StatefulWidget {
  String name;
  List<String> brands;
  List<Product> products;
  ListCallback rcallback;
  ListCallback dcallback;
  ListCallback bcallback;
  ListCallback gcallback;
  ListCallback ccallback;
  ListCallback scallback;
  ListCallback pcallback;
  ListCallback szcallback;
  ListCallback pricecallback;
  BoolCallback rboolcallback;
  BoolCallback dboolcallback;
  BoolCallback bboolcallback;
  BoolCallback gboolcallback;
  BoolCallback cboolcallback;
  BoolCallback sboolcallback;
  BoolCallback pboolcallback;
  BoolCallback szboolcallback;
  StringCallback startOutput;
  StringCallback endOutput;
  List<Product> product;
  String startValue;
  String endValue;
  List<String> gender;
  List<String> system;
  bool isReset;
  bool subsubCategoryisSelected;

  String selectedChoice;

  FilterScreen({
    this.name,
    this.brands,
    this.products,
    this.startOutput,
    this.endOutput,
    this.rcallback,
    this.rboolcallback,
    this.dcallback,
    this.dboolcallback,
    this.bcallback,
    this.bboolcallback,
    this.gcallback,
    this.gboolcallback,
    this.ccallback,
    this.cboolcallback,
    this.scallback,
    this.sboolcallback,
    this.pcallback,
    this.pboolcallback,
    this.szcallback,
    this.szboolcallback,
    this.pricecallback,
    this.product,
    this.gender,
    this.system,
    this.subsubCategoryisSelected,
    this.selectedChoice,
    this.startValue,
    this.endValue,
    this.isReset,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {



  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              RatingObject(
                  name: widget.name,
                  selectedChoice: widget.selectedChoice,
                  callback: widget.rcallback,
                  rboolcallback: widget.rboolcallback,
                  reset: widget.isReset),
              DiscountObject(
                  name: widget.name,
                  selectedChoice: widget.selectedChoice,
                  callback: widget.dcallback,
                  dboolcallback: widget.dboolcallback,
                  reset: widget.isReset),
              BrandObject(
                  name: widget.name,
                  selectedChoice: widget.selectedChoice,
                  callback: widget.bcallback,
                  bboolcallback: widget.bboolcallback,
                  reset: widget.isReset,
                  brands: widget.brands),
              if (widget.gender.contains('Male') ||
                  widget.gender.contains('Female'))
                GenderObject(
                    name: widget.name,
                    selectedChoice: widget.selectedChoice,
                    callback: widget.gcallback,
                    gboolcallback: widget.gboolcallback,
                    reset: widget.isReset),
              ColorObject(
                name: widget.name,
                selectedChoice: widget.selectedChoice,
                callback: widget.ccallback,
                cboolcallback: widget.cboolcallback,
                reset: widget.isReset,
              ),
              if (widget.system.contains('iOS') ||
                  widget.system.contains('Android') ||
                  widget.system.contains('Linux') ||
                  widget.system.contains('ChromeOs') ||
                  widget.system.contains('Windows'))
                OperatingSystemObject(
                  name: widget.name,
                  selectedChoice: widget.selectedChoice,
                  callback: widget.scallback,
                  sboolcallback: widget.sboolcallback,
                  reset: widget.isReset,
                ),
              MeasurementObject(
                  name: widget.name,
                  selectedChoice: widget.selectedChoice,
                  products: widget.products,
                  subsubCategoryisSelected: widget.subsubCategoryisSelected,
                  callback: widget.szcallback,
                  szboolcallback: widget.szboolcallback,
                  reset: widget.isReset),
              PriceObject(
                //for Price
                startOutput: widget.startOutput,
                endOutput: widget.endOutput,
                startValues: widget.startValue,
                endValues: widget.endValue,
                reset: widget.isReset,
              ),
              MerchantObject(
                name: widget.name,
                selectedChoice: widget.selectedChoice,
                callback: widget.pcallback,
                pboolcallback: widget.pboolcallback,
                reset: widget.isReset,
              ),
            ],
          )
        ],
      ),
    );
  }
}
