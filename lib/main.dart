import 'package:fit_clock/screen/intro_screen/intro_screen.dart';
import 'package:fit_clock/screen/sp_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: const Size(360, 690),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (_,child){
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Flutter Demo',
         theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
           useMaterial3: true,
         ),
         home:SplashScreen()
         // const BottomBar(index: 0,),
       );
     },
   );
  }
}


