import 'package:entry/entry.dart';
import 'package:fit_clock/common/constants/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.offAll(const BottomBar(index: 0,));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: Center(
        child: Entry.scale(
          duration: const  Duration(milliseconds: 2000),
            child: Image.asset(ImageControl.Sp_Img)
        ),
      ),
    );
  }
}
