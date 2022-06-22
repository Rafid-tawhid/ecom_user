
import 'package:ecom_user/pages/view_products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/auths.dart';
import '../provider/product_provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName='/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromKey=GlobalKey<FormState>();
  String? _email;
  String? _pass;
  String errMsg='';
  bool isLogin=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),),
      body: Center(
        child: Form(
          key: _fromKey,
          child: ListView(
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Text('User Login',style: TextStyle(fontSize: 24),),
              ),),
               TextFormField(
                 onSaved: (value){
                   _email=value;
                 },
                 keyboardType: TextInputType.emailAddress,
                 validator: (value){
                   if(value==null && value!.isEmpty){
                     return 'This Field is Required';
                   }
                   return null;
                 },
                 decoration: InputDecoration(
                   label: Text('Email Address'),
                   border: OutlineInputBorder()
                 ),
               ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                onSaved: (value){
                  _pass=value;
                },
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value==null && value!.isEmpty){
                    return 'This Field is Required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 40,),
              Center(child: ElevatedButton(onPressed: (){
                  isLogin=true;
                _loginUser();
              }, child: Text('Login '))),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New User?',),
                  SizedBox(width: 10,),
                  TextButton(onPressed: (){
                      isLogin=false;
                    _loginUser();
                  }, child: Text('Register',style: TextStyle(color: Colors.redAccent),))
                ],
              ),
              Center(child: Text(errMsg,style: TextStyle(color: Colors.redAccent),)),
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() async{
    if(_fromKey.currentState!.validate()){
      _fromKey.currentState!.save();
      try{
        User? user;
        if(isLogin){

          user=await FirebaseAuthService.loginUser(_email!, _pass!);
        }else{

          user=await FirebaseAuthService.registerUser(_email!, _pass!);
        }

       if(user!=null){
         Navigator.pushReplacementNamed(context, ViewProducts.routeName);
       }

      }on FirebaseAuthException catch(e){
        setState((){
          errMsg=e.message!;
        });
      }
    }
  }
}
