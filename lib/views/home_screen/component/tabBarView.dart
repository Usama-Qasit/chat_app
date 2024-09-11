

import 'package:chat_app/views/home_screen/component/status_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chats_component.dart';

Widget tabBarView(){
  return Expanded(
    child: TabBarView(
        children: [
          Container(
            color: Colors.white,
            child: chatComponent(),
          ),
          Container(color: Colors.white,
          child: statusComponent(),
          ),
          Container(color: Colors.green,
          ),
        ]
    ),
  );
}