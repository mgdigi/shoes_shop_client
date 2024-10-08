
// ignore_for_file: avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:shoes_shop_client/models/user/user.dart';
import 'package:shoes_shop_client/pages/home_page.dart';

class AuthController extends GetxController{

FirebaseFirestore firebase = FirebaseFirestore.instance;

late CollectionReference usersCollection;

TextEditingController  userNameController = TextEditingController();
TextEditingController userPhoneController = TextEditingController();

TextEditingController loginPhoneController = TextEditingController();

OtpFieldControllerV2 otpController = OtpFieldControllerV2();
bool otpFieldVisibily = false ;
int? otpSend;
int? otpEnter;

GetStorage box = GetStorage();

User? loginUser;
@override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if(user != null){
      loginUser = User.fromJson(user);
      Get.to(() => const HomePage());
    }

    super.onReady();
  }


@override
  void onInit() {
    usersCollection = firebase.collection('users');
    super.onInit();
  }

    addUsers(){
      
  try {
    if(otpSend == otpEnter){
       DocumentReference doc = usersCollection.doc();
    if(userNameController.text.isEmpty || userPhoneController.text.isEmpty){
      Get.snackbar('error', 'Vueillez remplir les champs', colorText: Colors.red);
      return;
    }
       User user = User(
        id: doc.id,
        name: userNameController.text,
        phone: int.parse(userPhoneController.text),
  );
  final userJson = user.toJson();
  
  Get.snackbar('Ajouté', 'vous etes inscrit avec succés✔', colorText: Colors.green);
   doc.set(userJson);
   setValuesDefaut();
    }else {
      Get.snackbar('Error', 'OTP incorrect', colorText: Colors.red);
    }
  } catch (e) {
    Get.snackbar('error', e.toString(), colorText: Colors.red);
  }
 }

 setValuesDefaut(){
    userNameController.clear();
    userPhoneController.clear();
    otpController.clear();
    update();
  }

sendOtp(){
   if(userNameController.text.isEmpty || userPhoneController.text.isEmpty){
      Get.snackbar('error', 'Vueillez remplir les chanmps', colorText: Colors.red);
      return;
    }
  try {
    final random = Random();
   int otp = 1000 + random.nextInt(9000);
  
   print(otp);

  if(otp != null){
    Get.snackbar('succces', 'L\'otp est envoyé avec succes ', colorText: Colors.green);
    otpSend = otp;
    otpFieldVisibily = true;
  }else {
    Get.snackbar('error', 'L\'otp n\'est pas envoyé  ', colorText: Colors.red);
  }
  } catch (e) {
   
    print(e);
  } finally{
   update();
  }
  

}

Future <void> loginWithphone() async{
  try{
    String phoneNumber = loginPhoneController.text;
    if(phoneNumber.isNotEmpty){
     var querySnapshot = await usersCollection.where('phone', isEqualTo: int.tryParse(phoneNumber)).limit(1).get();
       if(querySnapshot.docs.isNotEmpty){
        var userDoc = querySnapshot.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>;
        box.write('loginUser',userData);
        loginPhoneController.clear();
        Get.to(() => const HomePage());
        
        Get.snackbar('Success', 'vous etes connecte avec succes', colorText: Colors.green);
        }else {
         Get.snackbar('error', "l'utilisateur n'existe pas , inscrivez vous svp !", colorText: Colors.red);
     }
    }else {
      Get.snackbar('error', 'entrez un numero de telephone svp!', colorText: Colors.red);
     } 
  }catch(e){
    print("Vous ne pouvez pas vous connecter: $e");
    Get.snackbar('error', 'Vous ne pouvez pas vous connecter', colorText: Colors.red);
  }
}

}