



import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget statusComponent (){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.teal,
            child: Image.asset(icUser,color: Colors.white,),
          ),
          title: RichText(text: const TextSpan(
            children: [
              TextSpan(
                text: "My status\n",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: bold,
                  color: bgColor
                ),
              ),
              TextSpan(
                text: "Tap to add status updates",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: bold,
                    color: Colors.grey,
                ),
              ),
            ],
          )
          ),
        ),
        20.heightBox,
        recentUpdates.text.bold.gray400.make(),
        20.heightBox,
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin:  const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    shape:BoxShape.circle ,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal,
                      child: Image.asset(icUser,color: Vx.randomPrimaryColor,),
                    ),
                    title: "Username ".text.bold.color(bgColor).make(),
                    subtitle: "Today, 8:47 PM".text.gray400.make(),
                  ),
                );
              }),
        )
      ],
    ),
  );
}