
import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier{
  List<CartModel> cartList=[];

  void addToCart(ProductModel productModel){
    cartList.add(CartModel(productId: productModel.id!,
        productName: productModel.name!,
        price: productModel.price!));
       notifyListeners();
  }
  num getPriceWithQty(CartModel cartModel)=>cartModel.price * cartModel.qty;


  void removeFromCart(String id){
    final cartModel=cartList.firstWhere((carts) =>carts.productId ==id);
    cartList.remove(cartModel);
    notifyListeners();

  }

  bool isInCart(String id){
    bool tag=false;
    for(var c in cartList){
      if(c.productId==id){
        tag=true;
        break;
      }
    }
    return tag;
  }

  int get totalItemInCart=>cartList.length;

  void clearCart(){
    cartList.clear();
    notifyListeners();
  }

  void decreaseQty(CartModel cartModel){
    var index=cartList.indexOf(cartModel);
    if(cartList[index].qty>1){
      cartList[index].qty -=1;
    }
    notifyListeners();
  }
  void increaseQty(CartModel cartModel){
    var index=cartList.indexOf(cartModel);
    cartList[index].qty +=1;
    notifyListeners();
  }
  num get cartItemsTotalPrice{
    num total =0;
    cartList.forEach((element) {
      total+=element.price*element.qty;
    });
    return total;
  }

}