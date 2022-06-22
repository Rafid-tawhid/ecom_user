
import 'package:ecom_user/pages/view_products.dart';
import 'package:ecom_user/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/auths.dart';
import 'login_page.dart';

class LauncherPage extends StatefulWidget {
   static const String routeName='/launcher';

   @override
   State<LauncherPage> createState() => _LauncherPageState();
 }

 class _LauncherPageState extends State<LauncherPage> {
   @override
   void initState() {
     Future.delayed(Duration.zero,(){
       if(FirebaseAuthService.currentUser ==null){
         Navigator.pushReplacementNamed(context, LoginPage.routeName);
       }
       else{
         Navigator.pushReplacementNamed(context, ViewProducts.routeName);
       }
     });
     super.initState();
   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(

       body: Center(
         child: CircularProgressIndicator(),
       ),
     );
   }


}
