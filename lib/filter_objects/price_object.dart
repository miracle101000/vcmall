import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vc_mall/models/product.dart';
import 'package:vc_mall/providers/products.dart';

typedef void StringCallback(String val);
typedef void BoolCallback(bool val);

// ignore: must_be_immutable
class PriceObject extends StatefulWidget {
  StringCallback startOutput;
  StringCallback endOutput;
  BoolCallback callback;
  String startValues;
  String start;
  String endValues;
  bool reset = false;

  PriceObject(
      {this.startOutput,
      this.endOutput,
      this.startValues,
      this.endValues,
      this.callback,
      this.reset});

  @override
  _PriceObjectState createState() => _PriceObjectState();
}

class _PriceObjectState extends State<PriceObject> {
  var _expandedPrice = false;

  String start = '0';
  String end = '0';

  var startController;
  var endController;
  var rs = 0;
  var re = 0;

  @override
  void initState() {
    start = widget.reset != true ? widget.startValues : '0';
    end = widget.reset != true ? widget.endValues : '0';

    rs = int.parse(start);
    re = int.parse(end);

    startController = TextEditingController();

    endController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Price Range (₦) ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon:
                  Icon(_expandedPrice ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandedPrice = !_expandedPrice;
                });
              },
            ),
          ],
        ),
        if (_expandedPrice)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 3),
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        maxLines: 1,
//                          textInputAction: TextInputAction.done,
                        controller: startController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(8),
                          FilteringTextInputFormatter.digitsOnly
//                          ThousandsFormatter()
                        ],
                        decoration: InputDecoration(
                          hintText: rs > re ? end : start,
//                          isDense: true,
//                          labelText: 'From',
                          contentPadding:
                              const EdgeInsets.only(top: 8, left: 4, bottom: 3),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(0.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        onChanged: (texts) {
                          widget.startOutput(texts == '' ? '0' : texts.trim());
                          widget.callback(widget.reset);
                        },
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: endController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                            FilteringTextInputFormatter.digitsOnly
//                            ThousandsFormatter()
                          ],
                          decoration: InputDecoration(
                              hintText: rs > re ? start : end,
//
                              contentPadding:
                                  EdgeInsets.only(top: 8, left: 4, bottom: 3),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              )),
                          onChanged: (texts) {
                            widget.endOutput(texts == '' ? '0' : texts.trim());
                            widget.callback(widget.reset);

//
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
