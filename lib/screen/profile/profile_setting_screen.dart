import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fit_clock/common/common_widget/common_button.dart';
import 'package:fit_clock/screen/profile/plan_screen.dart';
import 'package:fit_clock/screen/profile/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../../common/constants/image.dart';
import '../home/bottom_bar.dart';

class ProfileSettingScreen extends StatelessWidget {
   ProfileSettingScreen({super.key});

  @override
  var data = [-0.5, 0.0, -0.1, 0.0, 0.2, 0.3, -0.1, -0.3, 0.3, 0.0, 0.0];
   var scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorConstants.skyColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(45.h),
          child: AppBar(
            backgroundColor:  ColorConstants.skyColor,
            surfaceTintColor: Colors.transparent,
            leading: InkWell(
                onTap: (){
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Icon(CupertinoIcons.text_alignleft)),
            actions: [
            InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                Get.to(SettingScreen());
                },
                child: const  Icon(Icons.settings,color: ColorConstants.blackColor,)),
              SizedBox(width: 20.w,)
            ],
          )
      ),
      drawer: Drawer(
        backgroundColor: ColorConstants.skyColor,
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImageControl.Sp_Img),

              ),
              SizedBox(height: 50.h,),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 0,));
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.home),
                    SizedBox(width: 20.w,),
                    Text("Home",style: AppStyles.blackColor14TextBold)
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),

              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 1,));
                },
                child: Row(
                  children: [
                    Icon(Icons.keyboard_voice),
                    SizedBox(width: 20.w,),
                    Text("Podcast",style: AppStyles.blackColor14TextBold,)
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 3,));
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.list_bullet),
                    SizedBox(width: 20.w,),
                    Text("Community",style: AppStyles.blackColor14TextBold,)
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(CupertinoIcons.person_fill,color: ColorConstants.themeColor),
                  SizedBox(width: 20.w,),
                  Text("Profile",style: AppStyles.blackColor14TextBold.copyWith(color: ColorConstants.themeColor),)
                ],
              ),

              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 20.w,),
                  Text("Log Out",style: AppStyles.blackColor14TextBold,)
                ],
              ),

            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("AniX's Profile ",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
                  Text("Basic Member . India",style: AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 14.sp),),
                ],
              ),

            ),
            SizedBox(height: 15.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              height: 40.h,
              width: double.maxFinite,
              color: ColorConstants.themeColor.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(text: "Unlimited access for premium !",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 14.sp,color: ColorConstants.themeColor),
                  )),
                  CustomButton(onTap: (){
                    Get.to(PlanScreen());
                  },
                    buttonHeight: 25.h,
                    buttonWidth: 70.w,
                    borderRadius:BorderRadius.circular(20.r),
                    text: "Buy",
                    style:AppStyles.blackColor14TextBold.copyWith(fontSize: 14.sp,color: ColorConstants.whiteColor) ,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              color: ColorConstants.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Goals",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 18.sp),),
                      const Icon(Icons.more_horiz,color: Colors.black45,)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Image.asset(ImageControl.weight,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Text("Weight",style: AppStyles.blackColor14TextBold,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.53,),
                      Text("66 kg",style: AppStyles.blackColor14TextBold,)
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 10.h,),
                  Container(
                    width: double.maxFinite,
                    height: 70.h,
                    child: Sparkline(
                      data: data,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text.rich(TextSpan(text:"Grate Job! You almost reach your goal. Keep your healthy lifestyle",style: AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 14.sp,),
                  )),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 10.h,),

                  Row(
                    children: [
                      Image.asset(ImageControl.nutrition,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Text("Nutrition",style: AppStyles.blackColor14TextBold,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.43,),
                      Text("1,200 cal",style: AppStyles.blackColor14TextBold,)
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Image.asset(ImageControl.water,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Text("Water",style: AppStyles.blackColor14TextBold,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.48,),
                      Text("8 glasses",style: AppStyles.blackColor14TextBold,)
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Image.asset(ImageControl.shoes,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Text("Daily Step",style: AppStyles.blackColor14TextBold,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.32,),
                      Text("10,000 Steps",style: AppStyles.blackColor14TextBold,)
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Image.asset(ImageControl.bed,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Text("Daily Sleep",style: AppStyles.blackColor14TextBold,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.42,),
                      Text("8 hours",style: AppStyles.blackColor14TextBold,)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:100.h ,),
          ],
        ),
      ),
    );
  }
}
