import 'package:ecom_user/pages/customer_info_page.dart';
import 'package:ecom_user/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static const String routeName='/cartPage';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          Consumer<CartProvider>(
            builder: (context,provider,_)=>IconButton(onPressed: (){
              provider.clearCart();

            }, icon: Icon(Icons.cancel)),

          )
        ],

      ),
      body: Consumer<CartProvider>(
        builder: (context,provider,_)=>Column(
          children: [
            Expanded(
              child: provider.totalItemInCart==0?Center(child: Text('Cart is Empty'),):
              ListView.builder(
                itemCount: provider.cartList.length,
                itemBuilder: (context,index){
                  final cartModel=provider.cartList[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      tileColor: Colors.grey.shade200,
                      title: Text(cartModel.productName,style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Quantity : ${cartModel.qty}',style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: (){
                                provider.decreaseQty(cartModel);
                              }, icon: Icon(Icons.remove)),
                               Text('QTY'),
                              IconButton(onPressed: (){
                                provider.increaseQty(cartModel);
                              }, icon: Icon(Icons.add))
                            ],
                          )
                        ],
                      ),
                      trailing: Text('৳ ${provider.getPriceWithQty(cartModel)}'),

                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.redAccent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total : ৳ ${provider.cartItemsTotalPrice}',style: TextStyle(color: Colors.white,),),
                  if(provider.totalItemInCart>0) TextButton(onPressed: (){
                    Navigator.pushNamed(context, CustomerPage.routeName);
                  }, child: Text('Checkout'),
                  style: TextButton.styleFrom(
                    primary: Colors.white
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
