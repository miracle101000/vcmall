import 'package:flutter/material.dart';

class MyShop extends StatelessWidget {
  static const routeName = '/my-shop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back), color: Colors.black, onPressed: (){
            Navigator.of(context).pop();
          },),
          actions: [
            FlatButton(onPressed: (){}, child: Text('Add a new Product',style: TextStyle(color: Colors.blue),))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('My Shop', style: TextStyle(color: Colors.black),),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myShopList(context, 'Edit your seller profile Info', 'Tell your customers more about you'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(' Edit your products',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w700),),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context,index){
              return Card(

              );
            }),
          )
        ],
      ),
    );
  }



  Widget myShopList(BuildContext context,String title, String subtitle) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
//                      softWrap: true,
//                      maxLines: 2,
//                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
      onTap: () {
//        Navigator.pushNamed(context, MyShop.routeName);
      },
    );
  }
}
