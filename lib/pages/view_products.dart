
import 'package:ecom_user/pages/cart_page.dart';
import 'package:ecom_user/provider/cart_provider.dart';
import 'package:ecom_user/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
import '../widgets/product_item.dart';

class ViewProducts extends StatefulWidget {
  static const String routeName='/all_products';

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  late ProductProvider _productProvider;


  @override
  void didChangeDependencies() {
    _productProvider=Provider.of<ProductProvider>(context,listen: true);
    _productProvider.getAllProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('All Products'),

        actions: [
        Consumer<CartProvider>(
          builder: (context,provider,_) => Stack(
            children: [
              IconButton(onPressed: (){
                Navigator.pushNamed(context, CartPage.routeName);
              }, icon: Icon(Icons.shopping_cart)),
              Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
                ),
                child: FittedBox(child: Text('${provider.totalItemInCart}')),
              )
            ],
          ),
        )
      ],),
      body:_productProvider.productList.isEmpty?Center(child: Text('No items Found'),):
      GridView.count(
        padding: EdgeInsets.all(5),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        childAspectRatio: 0.6,
        crossAxisSpacing: 4,
        children: _productProvider.productList.map((product) => ProductItem(product)).toList(),
      )
    );
  }

  Widget fadedImageWidget(String url){
    return FadeInImage.assetNetwork(
      fadeInDuration: Duration(seconds: 3),
      fadeInCurve: Curves.ease,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity ,
      placeholder: 'images/pc.jpg',
      image: url,
    );
  }
}
