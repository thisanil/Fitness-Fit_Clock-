import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../user profile/user_interest_screen.dart';

class BioMatricLogin extends StatefulWidget {
  const BioMatricLogin({super.key});

  @override
  State<BioMatricLogin> createState() => _BioMatricLoginState();
}

class _BioMatricLoginState extends State<BioMatricLogin> {

  final LocalAuthentication auth = LocalAuthentication();
  Future<void>fingerPrint() async {
    bool isAvaible;
      isAvaible=await auth.canCheckBiometrics;
    final List<BiometricType> availableBiometrics =
    await auth.getAvailableBiometrics();
      if(isAvaible){
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to Continue');
        if(didAuthenticate){
          Navigator.pop(context);
          Get.to(UserInterestScreen());
        }
        else{
          Get.defaultDialog(
              backgroundColor: ColorConstants.skyColor,
              barrierDismissible: false,
              title: "Fit Clock is locked",
              titlePadding: EdgeInsets.only(top: 10.h,bottom: 5.h),
              titleStyle: AppStyles.blackDarkColor20text,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              content: Column(
                children: [
                  Text('Authentication is required to access the Fit Clock app',style: AppStyles.gary14Color,),
                  SizedBox(height: 5.h,),
                  const Divider(),
                  SizedBox(height: 5.h,),
                  InkWell(
                      onTap: (){
                        fingerPrint();
                      },
                      child: Text("Unlock Now ",style: AppStyles.grayLight16Text.copyWith(fontSize: 18.sp,color: ColorConstants.themeColor),)),


                ],
              )
          );
        }
      }
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.skyColor,
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h,),
            const StepProgressIndicator(
              totalSteps: 7,
              currentStep: 3,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 70.h,),
            Icon(Icons.fingerprint,size: 80.h,color: ColorConstants.themeColor),
            SizedBox(height: 20.h,),
            Text("Enable Fingerprint",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height:10.h,),
            Text("I your enable touch ID. You don't need to\n enter your password when your login. ",style: AppStyles.gary14Color,),



            const Spacer(),
            CustomButton(
              onTap: (){
                fingerPrint();
              },
              text: "Continue",
            ),
            SizedBox(height: 15.h,),
            InkWell(
                onTap: (){

                },
                child: Text("Not Now",style: AppStyles.grayLight16Text.copyWith(fontSize: 14.sp,color: ColorConstants.themeColor),)),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
