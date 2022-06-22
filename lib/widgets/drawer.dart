import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user/auth/auths.dart';
import 'package:ecom_user/db/firestore_helper.dart';
import 'package:ecom_user/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.redAccent,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
          ),
          ListTile(
            leading: Icon(Icons.menu),
            title: Text('My Orders'),
          ),
          ListTile(
            onTap: (){
              FirebaseAuthService.logOutUser().then((value) => Navigator.pushReplacementNamed(context, LoginPage.routeName));
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          )
        ],
      ),
    );
  }
}
