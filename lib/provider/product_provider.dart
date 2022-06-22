
import 'package:flutter/material.dart';

import '../db/firestore_helper.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier{

  List<String> categoryList=[];
  List<ProductModel> productList=[];

  void getAllCategories(){
    FireStoreHelper.getAllCategories().listen((snapshot) {
      categoryList=List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['name']);
      notifyListeners();
    });
  }

  void getAllProducts(){
    FireStoreHelper.getAllProducts().listen((snapshot) {
      productList=List.generate(snapshot.docs.length, (index) =>
          ProductModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  Future<bool> checkAdimins(String email)=>FireStoreHelper.checkAdmins(email);

}