


import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/views/home_screen/component/app_bar.dart';
import 'package:chat_app/views/home_screen/component/drawer.dart';
import 'package:chat_app/views/home_screen/component/tabBar.dart';
import 'package:chat_app/views/home_screen/component/tabBarView.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return   SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer(),
          backgroundColor: bgColor,
          floatingActionButton: FloatingActionButton(onPressed: (){},
            backgroundColor: Colors.teal,
              child: const Icon(Icons.edit,color: bgColor,),
          ),
          body: Column(
            children: [
              appBar(scaffoldKey),
              tabbar(),
              tabBarView(),

            ],
          ),

        ),
      ),
    );
  }
}
