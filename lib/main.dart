import 'package:ecom_user/pages/cart_page.dart';
import 'package:ecom_user/pages/customer_info_page.dart';
import 'package:ecom_user/pages/launcher_page.dart';
import 'package:ecom_user/pages/login_page.dart';
import 'package:ecom_user/pages/view_products.dart';
import 'package:ecom_user/provider/cart_provider.dart';
import 'package:ecom_user/provider/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.red,
        ),
        home: LauncherPage(),
        routes: {
          LauncherPage.routeName:(context)=>LauncherPage(),
          LoginPage.routeName:(context)=>LoginPage(),
          ViewProducts.routeName:(context)=>ViewProducts(),
          CartPage.routeName:(context)=>CartPage(),
          CustomerPage.routeName:(context)=>CustomerPage(),
        },
      ),
    );
  }
}


