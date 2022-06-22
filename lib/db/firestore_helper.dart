import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class FireStoreHelper{
  static const String collectionAdmins='Admins';
  static const String collectionProduct='Products';
  static const String collectionCategory='Categories';

  static FirebaseFirestore _db=FirebaseFirestore.instance;

 static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories()=>_db.collection(collectionCategory).snapshots();
 static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts()=>_db.collection(collectionProduct).where('isAvailable',isEqualTo: true).snapshots();


   static Future<bool> checkAdmins(String email) async{
     final snapshot=await _db.collection(collectionAdmins)
         .where('email',isEqualTo: email).
     get();
     if(snapshot.docs.isNotEmpty){
       return true;
     }
     else{
       return false;
     }

   }


}