



import 'package:chat_app/views/intro_screen/phone_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:velocity_x/velocity_x.dart';

import 'consts/colors.dart';
import 'consts/images.dart';
import 'consts/strings.dart';
import 'consts/utils.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logo,width: 80,),
                  appname.text.size(25).fontFamily(bold).make(),

                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 3.0,
                    children:List.generate(listOfFeatures.length, (index){
                      return Chip(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                          color: Vx.gray400,
                        ),
                        label: listOfFeatures[index].text.semiBold.gray600.make(),);
                    }),
                  ),
                  20.heightBox,
                  slogan.text.size(34).fontFamily(bold).letterSpacing(1.5).make(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child:Column(
                children: [
                  SizedBox(
                    width: context.screenWidth - 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: (){
                        Get.to(()=>const VerificationScreen(),transition: Transition.downToUp);
                      },
                      child: cont.text.color(Colors.white).semiBold.size(16).make(),),
                  ),
                  10.heightBox,
                  poweredby.text.size(15).gray600.make(),

                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}

