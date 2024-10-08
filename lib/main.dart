import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shoes_shop_client/Firebase/firebase_option.dart';
import 'package:shoes_shop_client/controler/auth_controller.dart';
import 'package:shoes_shop_client/controler/home_controller.dart';
import 'package:shoes_shop_client/controler/purchase_controller.dart';
import 'package:shoes_shop_client/pages/login_page.dart';
import 'package:shoes_shop_client/pages/onboaring/onboaring_screen.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(PurchaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});                                                     
                                                                                
  // This widget is the root of your application.                               
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: OnboaringScreen(),
    );
  }
}

