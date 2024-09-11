import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/ist_screen.dart';
import 'package:chat_app/splash_screen.dart';
import 'package:chat_app/views/chat_screen/chatScreen.dart';
import 'package:chat_app/views/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'consts/firebase_consts.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  var isUser = false;
  checkUser()async{
    auth.authStateChanges().listen((User? user){
      if(user == null && mounted){
        setState(() {
          isUser= false;
        });
      }
      else{
        setState(() {
          isUser = true;
        });
      }

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        fontFamily: "lato",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: isUser ? HomeScreen() : FirstScreen(),
    );
  }
}





