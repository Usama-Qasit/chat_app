

import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/views/chat_screen/chatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

Widget chatComponent (){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
        itemBuilder: (BuildContext context , int index){
          return Card(
            child: ListTile(
              onTap: (){
                Get.to(()=>ChatScreen(),transition: Transition.downToUp);
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: bgColor,
                child: Image.asset(icUser,color: Colors.white,),
              ),
              title: "Dummy Names".text.size(16).semiBold.make(),
              subtitle: "Message here .. ".text.make(),
              trailing: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    icon: const Icon(Icons.access_time_filled,color: Colors.grey,),
                      onPressed: (){},
                      label: "Last seen ".text.gray400.make(),)
              ),
            
            ),
          );
        }),
  );
}