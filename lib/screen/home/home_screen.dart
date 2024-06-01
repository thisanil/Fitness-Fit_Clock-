import 'dart:developer';

import 'package:fit_clock/common/constants/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import 'bottom_bar.dart';
import 'home_subcategory/dailystep_screen.dart';
import 'home_subcategory/nutrition_screen.dart';
import 'home_subcategory/water_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
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
               overlayColor: const MaterialStatePropertyAll(Colors.transparent),
               onTap: (){
                 scaffoldKey.currentState?.openDrawer();
               },
               child: Icon(CupertinoIcons.text_alignleft)),
           actions: [
             CircleAvatar(
               radius: 20.r,
               backgroundImage: AssetImage(ImageControl.profile),

             ),
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

                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.home,color: ColorConstants.themeColor,),
                    SizedBox(width: 20.w,),
                    Text("Home",style: AppStyles.blackColor14TextBold.copyWith(color: ColorConstants.themeColor),)
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
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 4,));
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.person_fill),
                    SizedBox(width: 20.w,),
                    Text("Profile",style: AppStyles.blackColor14TextBold,)
                  ],
                ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Good Morning !",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
                  Text("Anix",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
                  ReadMoreText(
                    "Eat the right amount of food and stay hydrate through the day.",
                    style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 14.sp),
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    moreStyle: AppStyles.blackColor14Text.copyWith(color:ColorConstants.themeColor,fontSize: 14.sp),
                    lessStyle: AppStyles.blackColor14Text.copyWith(color:ColorConstants.themeColor,fontSize: 14.sp),
                    trimCollapsedText: 'More Detail',
                    trimExpandedText: ' Show less',
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              color: ColorConstants.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(NutritionScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(ImageControl.nutrition,height: 20.h,width: 20.h,),
                        SizedBox(width: 15.w,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nutrition",style: AppStyles.blackColor14TextBold,),
                                    Text("300 cal / 1200 cal",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                  ],
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: ColorConstants.themeColor.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text("On track",style: AppStyles.themeColor12text,),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              height: 5.h,
                              width: 310,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                gradient: LinearGradient(
                                    colors: [ColorConstants.themeColor, Color(0xFFE14D2A)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),

                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  InkWell(
                    onTap: (){
                      Get.to(WaterScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(ImageControl.water,height: 20.h,width: 20.h,),
                        SizedBox(width: 15.w,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Water",style: AppStyles.blackColor14TextBold,),
                                    Text("3 / 8 glasses",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                  ],
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.4,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.red.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text("Warning",style: AppStyles.themeColor12text.copyWith(color: Colors.red),),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              height: 5.h,
                              width: 310,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                gradient: const LinearGradient(
                                    colors:  [ Color(0xFFE14D2A),ColorConstants.themeColor,],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),

                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  InkWell(
                    onTap: (){
                      Get.to(DailyStepScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(ImageControl.shoes,height: 20.h,width: 20.h,),
                        SizedBox(width: 15.w,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Daily Step",style: AppStyles.blackColor14TextBold,),
                                    Text("7,323 / 10,000 Steps",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                  ],
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: ColorConstants.themeColor.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text("On track",style: AppStyles.themeColor12text,),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              height: 5.h,
                              width: 310,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                gradient: LinearGradient(
                                    colors: [ColorConstants.themeColor, Color(0xFFE14D2A)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),

                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      Image.asset(ImageControl.bed,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Daily Sleep",style: AppStyles.blackColor14TextBold,),
                                  Text("6 / 8 hours",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.35,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: ColorConstants.themeColor.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("On track",style: AppStyles.themeColor12text,),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          Container(
                            height: 5.h,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              gradient: LinearGradient(
                                  colors: [ColorConstants.themeColor, Color(0xFFE14D2A)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  ],
              ),
            ),
            SizedBox(height:10.h ,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170.h,width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                        image: AssetImage(ImageControl.gym_tainer),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170.h,width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                        image: AssetImage(ImageControl.adGif),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170.h,width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage(ImageControl.poster),
                    fit: BoxFit.fill
                  )
                ),
              ),
            ),

            SizedBox(height: 80.h,)

          ],
        ),
      ),
    );
  }
}
