
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../consts/strings.dart';

Widget tabbar(){

  return Container(
    child:  const TabBar(tabs: [

      Tab(text:chats,),

      Tab(text:status,),

      Tab(text:camera,),

    ],
    labelColor: Colors.white,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelColor: Vx.gray500,
    indicator: BoxDecoration(),
    ),
  );
}