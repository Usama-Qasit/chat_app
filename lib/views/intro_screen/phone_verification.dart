
import 'dart:ui';

import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/ist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/utils.dart';
import '../home_screen/home_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return  SafeArea(
      child: Scaffold(
        appBar:AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: letsconnect.text.bold.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [

              Form(
                key: controller.formKey,
                child: Column(
                children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value.length <6){
                      return "Please enter your username";
                    }
                    return null;
                  },
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Vx.blue900
                      ),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Vx.gray600,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.verified_user,color: Colors.black,),
                    alignLabelWithHint: true,
                    hintText: "eg. Alex",
                    labelText: "User",
                    labelStyle:const TextStyle(
                      color: Vx.gray600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                10.heightBox,

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value.length < 9){
                      return "Please enter your phone number ";
                    }
                    return null;
                  },
                  controller: controller.phoneController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Vx.gray600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Vx.gray600,
                        )
                    ),
                    prefixIcon: const Icon(Icons.phone_android_rounded,
                      color: Vx.gray600,
                    ),
                    alignLabelWithHint: true,
                    prefixText: "+92",
                    hintText: "eg. 1234567890",
                    labelText: "Phone Number",
                    labelStyle: const TextStyle(
                      color: Vx.gray600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              ),
              ),
              10.heightBox,
              otpmessage.text.semiBold.size(16).make(),

              Obx(()=>
                Visibility(
                  visible: controller.isOtpSent.value,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index)=> SizedBox(
                          width: 50,
                          child: TextField(
                            controller: controller.otpController[index],
                            onChanged: (value){
                              if(value.length== 1 && index <=5){
                                FocusScope.of(context).nextFocus();
                              }else if(value.isEmpty && index>0){
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            cursorColor:Colors.black,
                            style: const TextStyle(
                              fontFamily: bold,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "*",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.black
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.black
                                ),
                              )
                            ),
                          ),
                        ))
                    ),
                  ),
                ),
              ),
              const Spacer(),
      
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.screenWidth - 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bgColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                      onPressed: () async {
                      if(controller.formKey.currentState!.validate()){
                        if(controller.isOtpSent.value = false){
                          controller.isOtpSent.value = true;
                          await controller.sendOtp();
                        }else{
                          await controller .verifyOtp(context);
                        }
                      }

                      // Get.to(()=>const HomeScreen(),transition: Transition.downToUp);
                      },
                      child: continuebutton.text.semiBold.color(Colors.white).size(16).make(),),
                ),
              ),
              30.heightBox,
      
            ],
          ),
      
        ),
      ),
    );
  }
}
