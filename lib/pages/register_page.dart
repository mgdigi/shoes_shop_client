
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_client/controler/auth_controller.dart';
import 'package:shoes_shop_client/pages/login_page.dart';
import 'package:shoes_shop_client/widgets/otp_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AuthController>(builder: (ctrl) {
        return Scaffold(
          body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration:  BoxDecoration(
             color: Colors.blueGrey[50]
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
       
      
           const Text(
            "Create Your Account !!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.deepPurple
            ),
            ),

            const SizedBox(height: 20,),

              TextField(
                controller: ctrl.userNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                prefixIcon: const Icon(Icons.person),
                label: const Text('Nom Complet' ),
                hintText: 'Entrer votre Nom complet'

              ),
            ),
            
            const SizedBox(height: 20,),

            TextField(
              controller: ctrl.userPhoneController,
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
                if(ctrl.otpFieldVisibily){
                  ctrl.addUsers();
                }else{
                  ctrl.sendOtp();
                }
              },
               style:  ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple
               ),
               child:  Text(ctrl.otpFieldVisibily ? 'Register' : 'Send OTP'),
               ),

               const SizedBox(height: 10,), 

               OtpTextField(otpController: ctrl.otpController, visible: ctrl.otpFieldVisibily, onCompleted:(otp){ 
                ctrl.otpEnter = int.tryParse(otp ?? '0000') ;
               },),
               
                const SizedBox(height: 20,),

               TextButton(
                onPressed: (){
                  Get.to(() => const LoginPage());
                },
                 child: const Text('Login')
                 )


        ],
      ),
    )
    );
  }
    );
  }
}