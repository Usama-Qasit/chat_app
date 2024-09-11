

import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/firebase_consts.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:chat_app/controllers/profile_controller/profile_controller.dart';
import 'package:chat_app/services/store_servies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller  = Get.put(ProfileController());

    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(

        title: profileText.text.white.semiBold.make(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body:  SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder(
              future: StoreServies.getUser(currentUser!.uid),
              builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData){
                  var data = snapshot.data!.docs[0];

                  controller.nameController = data['name'];
                  controller.phoneController = data['phone'];


                  return Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 50,
                          child: Stack(
                            children: [
                              Image.asset(icUser,color: Colors.white,),
                              const Positioned(
                                right: 0,
                                bottom: 15,
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.teal,
                                    child: Icon(Icons.camera_alt_outlined,color: Colors.white,)
                                ),
                              ),
                            ],
                          )
                      ),
                      ListTile(
                        leading: const Icon(Icons.person,color: Colors.white,),
                        title: TextFormField(
                          controller: controller.nameController,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,

                          ),
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            suffixIcon:  const Icon(Icons.edit,color: Colors.white,),
                            label: "Name".text.white.semiBold.make(),
                            isDense: true,
                            labelStyle:const TextStyle(fontFamily:bold,color: Colors.white),
                          ),
                        ),
                        subtitle: profileSubText.text.white.semiBold.make(),
                      ),

                      ListTile(
                        leading: const Icon(Icons.info,color: Colors.white,),
                        title: TextFormField(
                          controller: controller.aboutController,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            label: "About".text.white.semiBold.make(),
                            isDense: true,
                            labelStyle: const TextStyle(color: Colors.white),
                            suffixIcon: const Icon(Icons.edit,color: Colors.white,),
                          ),
                        ),
                      ),

                      20.heightBox,

                      ListTile(
                        leading: const Icon(Icons.call,color: Colors.white,),
                        title: TextField(
                          controller: controller.phoneController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: "Phone".text.white.make(),
                            isDense: true,
                            suffixIcon: const Icon(Icons.edit,color: Colors.white,),
                            labelStyle:const TextStyle(color: Colors.white,fontFamily: bold),

                          ),
                        ),
                      ),
                    ],
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),);
                }
              },
          ),
        ),
      ),

    );

  }
}
