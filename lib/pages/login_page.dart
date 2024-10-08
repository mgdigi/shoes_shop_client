import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_client/controler/auth_controller.dart';
import 'package:shoes_shop_client/pages/register_page.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (ctrl) {
        return Scaffold(
        body : Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration:  BoxDecoration(
             color: Colors.blueGrey[50]
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         
    
        const Text(
            "Welcome Back!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.deepPurple
            ),
            ),

            const SizedBox(height: 20,),

            TextField(
              controller: ctrl.loginPhoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                prefixIcon: const Icon(Icons.phone_android),
                label: const Text('Phone Number' ),
                hintText: 'Entrer votre Numéro'

              ),
            ),

             const SizedBox(height: 20,),

             ElevatedButton(
              onPressed: (){
                ctrl.loginWithphone();
              },
               style:  ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple
               ),
               child: const Text('Login'),
               ),
               TextButton(
                onPressed: (){
                  Get.to(() => const RegisterPage());
                },
                 child: const Text('Register new account')
                 )


        ],
      ),
    )
    );
  }
  );
  }
}