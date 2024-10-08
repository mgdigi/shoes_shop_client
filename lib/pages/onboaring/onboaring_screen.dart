
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoes_shop_client/pages/onboaring/intro_page.dart';

import 'package:shoes_shop_client/pages/register_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboaringScreen extends StatefulWidget {
  const OnboaringScreen({super.key});

  @override
  State<OnboaringScreen> createState() => _OnboaringScreenState();
}

PageController _controller = PageController();

bool onLastPage = false;

class _OnboaringScreenState extends State<OnboaringScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
        children: const [
           IntroPage(title: 'Prêt à marcher avec style?', subtitle: "Bienvenue dans l'univers des chaussures de qualité." , image: 'assets/intro1.png',),
           IntroPage(title: 'Marques emblématiques', subtitle: "Des classiques intemporels aux dernières tendances, nous avons toutes les grandes marques sous un même toit." , image: 'assets/intro2.png',),
           IntroPage(title: 'Engagement envers la qualité', subtitle: "Chez NOUS, la qualité est notre priorité. Découvrez des chaussures qui durent et qui impressionnent." , image: 'assets/intro3.png',)
        ],
      ),

      //dot indicators
       Container(
        alignment: const Alignment(0, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*
            GestureDetector(
              onTap: (){
                _controller.jumpToPage(2);
              },
              child: const Text('Skip')
              ),
              */

            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.grey.shade100
                  ),
                  onPressed: (){
                   _controller.jumpToPage(2);
                  },
                    child: const Text('Skip')
                   ),

            SmoothPageIndicator(controller: _controller, count: 3,),
            
            onLastPage ?
             
             ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.grey.shade100
                  ),
                  onPressed: (){
                   Get.to(() => const RegisterPage());
                  },
                      child: const Text('Start')
                   )

             /*
            GestureDetector(
              onTap: (){
                Get.to(() => const RegisterPage());
              },
              child: const Text('Start')
              )*/ : 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.grey.shade100
                  ),
                  onPressed: (){
                   _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                   curve: Curves.easeIn
                   );
                  },
                     child: const Text('Next')
                   ),

              /*
              GestureDetector(
              onTap: (){
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                   curve: Curves.easeIn
                   );
              },
              child: const Text('Next')
              )
              */
          ],
        )
        )
        ],
      )
    );
  }
}