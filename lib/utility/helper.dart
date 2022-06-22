import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime dateTime,String format){
  return DateFormat(format).format(dateTime);
}
Future<bool> isConnectedToInterNet() async{
  final result=await Connectivity().checkConnectivity();
  if(result==ConnectivityResult.mobile ||result==ConnectivityResult.wifi){
    return true;
  }
  else {
    return false;
  }
}
void showMessage(BuildContext context,String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}