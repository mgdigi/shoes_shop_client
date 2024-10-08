import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PurchaseController extends GetxController{

  double orderPrice = 0;
  String orderItem = '';
  TextEditingController address = TextEditingController();
 


submitOrder({required double price, required String item}){
  orderPrice = price;
  orderItem = item;
 
}
}