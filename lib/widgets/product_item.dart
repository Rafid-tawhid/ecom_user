import 'package:ecom_user/models/product_model.dart';
import 'package:ecom_user/provider/cart_provider.dart';
import 'package:ecom_user/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final  ProductModel _productModel;

  ProductItem(this._productModel);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
      Expanded(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
          child: FadeInImage.assetNetwork(
          fadeInDuration: Duration(seconds: 3),
          fadeInCurve: Curves.ease,
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: 'images/pc.jpg',
          image: widget._productModel.imageDownloadUrl!,
    ),
        ),
      ),
          ListTile(
            title: Text(widget._productModel.name!,style: TextStyle(fontSize: 16),),
            subtitle: Text(widget._productModel.category!.toString()),

          ),
          Text(widget._productModel.price!.toString()+' ৳',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.redAccent),),


          Consumer<CartProvider>(
            builder: (context,provider,_)=>ElevatedButton(
                onPressed: (){
                   if(provider.isInCart(widget._productModel.id!)){
                     provider.removeFromCart(widget._productModel.id!);
                   }
                   else{
                     provider.addToCart(widget._productModel);
                   }
                },

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(provider.isInCart(widget._productModel.id!)?Icons.remove_shopping_cart:Icons.shopping_cart),
                    Text(provider.isInCart(widget._productModel.id!)? 'Remove' :'Add'),

                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
