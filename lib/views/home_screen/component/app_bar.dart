

import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../consts/strings.dart';
import '../../../consts/utils.dart';

Widget appBar(GlobalKey <ScaffoldState>key){

  return Container(
    height: 80,

    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            key.currentState!.openDrawer();
          },
          child: Container(

            decoration:  BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight: Radius.circular(80),),
            ),
            height:80 ,
            width: 90,
            child: const Icon(Icons.settings,color: Colors.white,),
          ),
        ),
        const SizedBox(width: 18,),
        RichText(text:
        const TextSpan(
          children: [
            TextSpan(
                text:"$appname\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                ),
            ),
            TextSpan(
              text: "                $connectingLive",
              style: TextStyle(
                color: Vx.gray600,
                fontSize: 14,

              ),
            ),
          ],
        ),
        ),

        const SizedBox(width: 18),
        CircleAvatar(
          radius: 25,
          backgroundColor: bgColor,
          child: Image.asset(icUser,color: Colors.white,),
        ),
      ],
    ),
  );
}