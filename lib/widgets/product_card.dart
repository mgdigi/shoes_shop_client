
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

final String name;
final double price;
final String imageurl;
final String offerTag;
final Function onTap;

  const ProductCard({super.key, required this.name, required this.price, required this.imageurl, required this.offerTag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: (){
          onTap();
        },
        child: Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(offerTag),
                 ),
                 IconButton(
                  onPressed: (){},
                   icon: const Icon(Icons.favorite)
                   )
                ],
                ),
              Image.network(
                imageurl,
                fit: BoxFit.cover , 
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold,),),
                
                Text(price.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, ),)
             ],)
              
            ],
          ),
        ),
      ),
    );
  }
}