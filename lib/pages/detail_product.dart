import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_client/controler/purchase_controller.dart';
import 'package:shoes_shop_client/models/product/product.dart';
import 'package:shoes_shop_client/widgets/adress_dialog.dart';
import 'package:shoes_shop_client/widgets/select_size.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

List mycolors = [Colors.black, Colors.green, Colors.yellow, Colors.red];

Color primaryColor = mycolors[0];

int myCurrentIndex = 0;



ButtonStyle getButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.green; // Couleur verte lorsque sélectionné
          }
          return null; // Aucune couleur définie pour les autres états
        },
      ),
    );
  }

class _DetailProductState extends State<DetailProduct> {
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Product product = Get.arguments['data'];
    
    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Detail du produit",
              style: TextStyle(fontWeight : FontWeight.bold),
            ),
            
          ),
          body: SingleChildScrollView(
            child: Column(
              
              children: [
                Stack(
                children: [
                  SizedBox(
                    height: 320,
                    width: double.infinity, // Utiliser double.infinity pour couvrir toute la largeur
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.green,
                        BlendMode.hue,
                      ),
                      child: Image.network(
                        product.image ?? '',
                        fit: BoxFit.cover, // Utiliser BoxFit.cover pour couvrir toute la largeur
                      ),
                    ),
                  ),
                                 
                ],
              ),
              const SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        myCurrentIndex = index; // Mettre à jour l'index de l'image principale
                      });
                    },
                    child: Image.network(
                      product.image ?? 'url', // Utiliser l'image correspondante dans la liste
                      width: width * 0.2,
                      height: width * 0.2,
                    ),
                  ),
                ),
              ),
      
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .3,
                            child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Colors",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                for (var i = 0; i < 4; i++)
                                  builContainerColor(mycolors[i]),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Text(product.name ?? 'no name',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite))
                       ], 
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6)
                          ),
                        child:  Text(
                          'Rs: ${product.price ?? ''}', 
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                             fontSize: 20),)),
                      
                      const SizedBox(
                        height: 10,
                      ),
      
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Select Size  ', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),)),
                      
                   const SelectSize(),
                   const SizedBox(height: 10,),
                     
                      const SizedBox(
                        height: 10,
                      ),
                     
                       const Align(
                         alignment: Alignment.bottomLeft,
                         child: Text("Descption :",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                       ),
                       Text(
                        product.descriptin ?? "",
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [         
                          Flexible(
                 child: TextButton(
                    onPressed: () {  },
                    
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                    ),
                    child: const Text(
                      'Add to Cart',
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                       ),),
                  ),
               ),
              
      
               Flexible(
                 child: TextButton(
                    onPressed: () { 
                      AdressDialog(controller: ctrl.address, onPressed: () {  ctrl.submitOrder(price: product.price ?? 0, item: product.name ?? 'No name'); },);
                     // ctrl.submitOrder(price: product.price ?? 0, item: product.name ?? 'No name');
                     },
                    
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                    ),
                    child: const Text(
                      'Buy Now',
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                       ),),
                  ),
               ),
              
            ],
          ),
      
          );
          }
     );
    
    
  }

  builContainerColor(Color myColor) => SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 12,
                  child: Icon(
                    Icons.check,
                    size: 25,
                    color:
                        primaryColor == myColor ? myColor : Colors.transparent,
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        primaryColor = myColor;
                      });
                    },
                    icon: Icon(
                      Icons.circle,
                      size: 35,
                      color: myColor.withOpacity(.5),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
  }