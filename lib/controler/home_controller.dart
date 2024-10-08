import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_client/models/product/product.dart';
import 'package:shoes_shop_client/models/product_brands/product_brand.dart';


class HomeController extends GetxController{
  
   FirebaseFirestore firebase = FirebaseFirestore.instance;
 
 late CollectionReference productCollection;
 late CollectionReference brandsCollection;

 List<Product> products = [];
 List<Product> productShowInUi = [];
 List<ProductBrands> brands = [];
  @override
  Future<void> onInit() async{
    productCollection = firebase.collection('products');
    brandsCollection = firebase.collection('brands');
    await fetchProductsBrands();
    await fetchProducts();
    super.onInit();
  }

  fetchProducts() async{
  try {
     QuerySnapshot productSnapshot = await  productCollection.get();
   final List<Product> receiveProducts = productSnapshot.docs.map((doc) =>
     Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
   products.clear();
   products.assignAll(receiveProducts);
   productShowInUi.assignAll(products);
   Get.snackbar('Succés', 'les produit sont chargés avec succés✔', colorText: Colors.green);
  } catch (e) {
    Get.snackbar('error', e.toString(), colorText: Colors.red);
    
  }finally{
    update();
  }
  
 }

 fetchProductsBrands() async{
  try {
     QuerySnapshot brandSnapshot = await  brandsCollection.get();
   final List<ProductBrands> receiveBrands = brandSnapshot.docs.map((doc) =>
     ProductBrands.fromJson(doc.data() as Map<String, dynamic>)).toList();
   brands.clear();
   brands.assignAll(receiveBrands);
   
  } catch (e) {
    print('Exception: $e');
   Get.snackbar('error', e.toString(), colorText: Colors.red);

  }finally{
    update();
  }
  
 }

 filterByBrand(String brand){
  productShowInUi.clear();
  productShowInUi = products.where((product) => product.brand == brand).toList();
  update();
 }

filterByCategory(List<String> category){
  if(category.isEmpty) {
    productShowInUi = products;
  } else{
    List<String> lowerCasecategory = category.map((categori) => categori.toLowerCase()).toList();
    productShowInUi = products.where((product) => lowerCasecategory.contains(product.category?.toLowerCase())).toList(); 
  }
   update();
}

sortByPrice({required bool ascending}){
  List<Product> sortedProducts = List<Product>.from(productShowInUi);
  sortedProducts.sort((a,b) => ascending ? a.price!.compareTo(b.price!) : b.price!.compareTo(a.price!));
  productShowInUi = sortedProducts;
  update();
}

}