import 'package:fit_clock/common/common_widget/common_button.dart';
import 'package:fit_clock/common/common_widget/common_textfield.dart';
import 'package:fit_clock/common/constants/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import 'login_with_mobile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  List _listIcon=[
    ImageControl.googleIcon,
    ImageControl.facebookIcon,
    ImageControl.twitterIcon,
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.skyColor,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              Image.asset(ImageControl.appIcon,height: 100.h,width: 100.h,),
              Text('Login',style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
              SizedBox(height: 50.h,),
              CustomTextField(
                prefixIcon: Icon(Icons.person),
                fillColor: ColorConstants.whiteColor,
                hintText: "Email Address",
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                prefixIcon: Icon(Icons.lock),
                fillColor: ColorConstants.whiteColor,
                hintText: "Password",
              ),


           SizedBox(height: 50.h,),
           CustomButton(

             onTap: (){
               Get.to(const LoginWithMobile());

             },
           text: "Continue",
           ),
              SizedBox(height: 40.h,),
              Text('Sign in with',style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
              Container(
                height: 60.h,
                width: 200.w,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: CircleAvatar(
                          backgroundColor: ColorConstants.whiteColor,
                          radius: 25.r,
                          child: Image.asset(_listIcon[index],height: 20.h,width: 20.w,color: ColorConstants.themeColor,),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
