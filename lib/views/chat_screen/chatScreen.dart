
import 'dart:ui';

import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: chatText.text.white.make(),
        actions: const [
          Icon(Icons.more_vert_rounded,color: Colors.white,)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RichText(text: const TextSpan(
                      children: [
                        TextSpan(text: "Username\n",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: bgColor,
                          fontSize: 18,
                        ),
                        ),

                        TextSpan(
                          text: "Last Seen",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey
                        ),
                        ),
                      ],
                    )),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 25,
                    child: Icon(Icons.video_call,color: Colors.white,),
                  ),
                  10.widthBox,
                  const CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 25,
                    child: Icon(Icons.call,color: Colors.white,),
                  ),
                ],
              ),
            ),
            20.heightBox,

            Expanded(
              child: ListView.builder(
                physics:const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                  itemBuilder: (BuildContext context,int index ){
                  return  Directionality(
                    textDirection: index.isEven ? TextDirection.rtl:TextDirection.ltr,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                           CircleAvatar(
                             backgroundColor: index.isEven ? Colors.teal: Colors.black,
                             child: Image.asset(icUser,color: Colors.white,),
                          ),
                          20.widthBox,
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: index.isEven ? Colors.teal : Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: "This is the dummy messages ".text.white.semiBold.make(),
                              ),
                            ),
                          ),
                          5.widthBox,
                          Directionality(
                              textDirection: TextDirection.ltr, child: "11:00 AM".text.black.make()),
                        ],
                      ),
                    ),
                  );
                  },
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 56,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const TextField(
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.emoji_emotions_rounded,color: Colors.white,),
                        suffixIcon: Icon(Icons.attachment_rounded,color: Colors.white,),
                        hintText: "Type message here.. ",
                        hintStyle:TextStyle(fontSize: 14,fontFamily: bold,color: Colors.white),
                      ),
                    ),
                  )),
                  10.widthBox,
                  const CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 30,
                      child: Icon(Icons.send,color: Colors.white,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
