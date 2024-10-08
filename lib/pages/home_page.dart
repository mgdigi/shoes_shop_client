import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_client/controler/home_controller.dart';
import 'package:shoes_shop_client/pages/detail_product.dart';
import 'package:shoes_shop_client/pages/login_page.dart';
import 'package:shoes_shop_client/widgets/brand_card.dart';
import 'package:shoes_shop_client/widgets/drop_down_btn.dart';
import 'package:shoes_shop_client/widgets/multi_selected_drop_down_btn.dart';
import 'package:shoes_shop_client/widgets/product_card.dart';

final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.brightness_6,
  ];

//var _bottomNavIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final logo = 'https://firebasestorage.googleapis.com/v0/b/shoes-shop-8639d.appspot.com/o/logos%2FNew-Balance-01.png?alt=media&token=372fb7c9-2fc8-4207-8ac0-ac9ca67c6b01';

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(builder: (ctrl) {
        return RefreshIndicator(
          onRefresh: () async{ 
            ctrl.fetchProducts();
           },
          child: Scaffold(
            appBar: AppBar(
            title: const Center(child: Text('PowerMarket' , style: TextStyle(fontWeight: FontWeight.bold),)) ,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading:  IconButton(
               onPressed: (){},
                 icon: const Icon(Icons.shopping_cart)),
              
            actions: [
              IconButton(
               onPressed: (){
                GetStorage  box = GetStorage();
                box.erase();
                Get.offAll(const LoginPage());
              },
               icon: const Icon(Icons.logout)),
            ],
          ),
                body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(10),
                   child: TextField(
                    keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded, size: 35,),
                        
                        border: OutlineInputBorder(      
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none
                      
                      ),
                    hintText: 'qu\'est ce que vous cherchez ? ' ,
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  
                  
                ),
             ),
             
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical : 20.0),
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.brands.length,
                  itemBuilder: (context, index){
                   return InkWell(
                    onTap: (){
                      ctrl.filterByBrand(ctrl.brands[index].name ?? 'no name');
                    },
                     child: BrandCard(
                      imageUrl: ctrl.brands[index].imageUrl ?? 'urll',),
                   );
                  }
                  ),
              ),
            ),
            
            Row(
              children: [
                Flexible(
                  child: DropDownButton(
                    items: const ['Rs: du moins cher au plus cher', 'Rs: du plus cher au moins cher '],
                     selectItemText: 'trier ',
                      onSelected: (selected ) { 
                        ctrl.sortByPrice(ascending: selected == 'Rs: du moins cher au plus cher' ? true : false  );
                       },)
                  ),
                Flexible(
                  child: MultiSelectedDropDownButton(
                    items:const ['Sneakers', 'Basket', 'Athletic shoes', 'Ballet flats'],
                     onSelectedChanged: (selectedItems) { 
                      ctrl.filterByCategory(selectedItems);
                      },))
              ],
            ),
            const SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.66,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            itemCount: ctrl.productShowInUi.length,
            itemBuilder: (context, index) {
              return  ProductCard (
               name: ctrl.productShowInUi[index].name ?? 'No name',
               imageurl: ctrl.productShowInUi[index].image ?? 'url',
               offerTag: '20% off', 
               price: ctrl.productShowInUi[index].price ?? 00, 
               onTap: (){
                Get.to(() => const DetailProduct(), arguments: {'data': ctrl.productShowInUi[index]});
               },);
            },
          ),
          
          )
          
          
          ],
                ),
              ),
              /*
          
              bottomNavigationBar: AnimatedBottomNavigationBar(
                icons: iconList,
                iconSize: 30,
                backgroundColor: Colors.grey,
                activeIndex: _bottomNavIndex,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                leftCornerRadius: 50,
                rightCornerRadius: 50,
                onTap: (index) => setState(() => _bottomNavIndex = index),
                gapWidth: 8,
               
                //other params
             ),
            */
              ),
        );
    }
     );
     }
      
  }
