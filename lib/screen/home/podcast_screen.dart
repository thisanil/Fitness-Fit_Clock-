import 'package:fit_clock/common/constants/image.dart';
import 'package:fit_clock/screen/home/podcast_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../profile/plan_screen.dart';
import 'bottom_bar.dart';

class PodcastScreen extends StatelessWidget {
   PodcastScreen({super.key});

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
              Row(
                children: [
                  Icon(Icons.keyboard_voice,color: ColorConstants.themeColor,),
                  SizedBox(width: 20.w,),
                  Text("Podcast",style: AppStyles.blackColor14TextBold.copyWith(color: ColorConstants.themeColor),)
                ],
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
        physics:const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text("Podcast",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
            ),
            SizedBox(height: 15.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: InkWell(
                overlayColor:const  MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.to(const PodcastDetailScreen());
                },
                child: Container(
                  height: 160.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image:const  DecorationImage(
                      image: AssetImage(ImageControl.podCast),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Sleep with me\nBedtime stories",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 20.sp,color: ColorConstants.whiteColor),),
                        SizedBox(height: 20.h,),
                        Text("1 / 4 sessions",style: AppStyles.greyColor10Text.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10.h,),
                      Container(
                       decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r)),
                       child: ClipRRect(
                       borderRadius: BorderRadius.circular(30.r),
                         child:const LinearProgressIndicator(
                          minHeight: 5.0,
                          value: 0.25,
                          color: Colors.white,
                          backgroundColor: Color(0xFF3B2D73),
                        ),
                      ),
                    ),
                        SizedBox(height: 15.h,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
            SizedBox(height: 15.h,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal:10.w ),
              color: ColorConstants.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wellness",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 18.sp,),),
                  SizedBox(height: 10.h,),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          children: [
                            Container(
                              height:60,
                              width: 60,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10.r),
                                  image:const  DecorationImage(
                                      image: AssetImage(ImageControl.podCast),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            SizedBox(width: 15.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Living Beyond Fear",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                                Text("15 minutes",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                              ],
                            ),

                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
            SizedBox(height: 80.h,)
          ],
        ),
      ),
    );
  }
}
