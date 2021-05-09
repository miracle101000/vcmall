class Order{
  String itemName;
  String imageUrl;
  var  finalQuantity = 1;
  var finalPrice = 0;

  Order(this.itemName,this.imageUrl,this.finalPrice,this.finalQuantity);

  String name (){
    return this.itemName;
  }

  int price (){
    return this.finalPrice;
  }

  int quanity (){
    return this.finalQuantity;
  }


}