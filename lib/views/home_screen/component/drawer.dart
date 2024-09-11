

import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/views/chat_screen/chatScreen.dart';
import 'package:chat_app/views/profile_screen/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../consts/firebase_consts.dart';

Widget drawer(){

  return  Drawer(
    backgroundColor: bgColor,
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(25)),

    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.arrow_back,color: Colors.white,).onTap((){
              Get.back();
            }),
            title: settings.text.semiBold.make(),
          ),
          20.heightBox,
          CircleAvatar(
            radius: 45,
            backgroundColor: bgColor,
            child: Image.asset(icUser,color: Colors.white,),
          ),
          10.heightBox,
          "Username".text.white.semiBold.size(16).make(),
          20.heightBox,
          const Divider(height: 1,color: Colors.white,),
          10.heightBox,

          ListView(
            shrinkWrap: true,
            children: List.generate(drawerIconsList.length,
                  (index)=>ListTile(
                    onTap: (){
                      switch(index){
                        case 0:
                        Get.to(()=>const ProfileScreen());
                        break;
                        default:
                      }
                    },
              leading: Icon(
                drawerIconsList[index],
                color: Colors.white,
              ),
              title: drawerTitleList[index].text.semiBold.white.make(),
            ),
            ),
          ),

          10.heightBox,
          const Divider(height: 1,color: Colors.white,),
          10.heightBox,
          ListTile(
            leading: const Icon(Icons.share,color: Colors.white,),
            title: inviteText.text.semiBold.white.make(),
          ),
          Spacer(),
           ListTile(
             onTap: ()async{
               await auth.signOut();
               Get.offAll(()=>ChatScreen());
             },
            leading: const Icon(Icons.logout,color: Colors.white,),
            title: logoutText.text.white.make(),
          ),
        ],
      ),
    ),
  );
}