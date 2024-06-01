import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import '../../../common/constants/colors.dart';
import '../../../common/constants/font_style.dart';
import '../../../common/constants/image.dart';



class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(45.h),
          child:AppBar(
            backgroundColor: ColorConstants.whiteColor,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),

          ) ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(TextSpan(text: "You have drank \n",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),
                children: [
                  TextSpan(text: "3 glasses ",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,color: ColorConstants.themeColor)),
                  TextSpan(text: "today"),
                ]

            )),
            SizedBox(height: 30.h,),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w,),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 40.w,
              crossAxisSpacing: 10.h,
              mainAxisExtent: 50.h
              ), itemBuilder: (context,index){
                if(index==0 || index==1||index==2){
                  return Image.asset(ImageControl.waterGlass,color: ColorConstants.themeColor,);
                }
                else
                  {
                    return Image.asset(ImageControl.waterGlass,color: ColorConstants.blackColor.withOpacity(0.5));
                  }
            }),
            SizedBox(height: 30.h,),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("250 ml",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
                      Text("Water Drank",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                    ],
                  ),
                  VerticalDivider(color: Colors.grey.shade400,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8 Glasses",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
                      Text("Daily Goal",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              height: 40.h,
              width: double.maxFinite,
              color: Colors.red.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(text: "You haven't much. ",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 12.sp,color: ColorConstants.redColor),
                      children: [
                        TextSpan(text: "Set Reminder",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 12.sp,color: ColorConstants.redColor,decoration: TextDecoration.underline,decorationThickness: 2,decorationColor: ColorConstants.redColor)),

                      ]

                  )),
                  Icon(CupertinoIcons.clear,size: 18.sp,)
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              height: 10.h,
              width: double.maxFinite,
              color: ColorConstants.skyColor,
            ),
            SizedBox(height: 10.h,),
            Text("Insight",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 20.sp),),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 0.4,
                    footer: 'M',
                    footerStyle:AppStyles.blackColor14TextBold,
                    color: const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,
                    ],
                  ),
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 0.6,
                    footer: 'T',
                    footerStyle:AppStyles.blackColor14TextBold,
                    color: const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,
                    ],
                  ),
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 1,
                    footer: 'W',
                    footerStyle:AppStyles.blackColor14TextBold,
                    color:const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,
                    ],
                  ),
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 1,
                    footer: 'T',
                    footerStyle:AppStyles.blackColor14TextBold,
                    color: const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,
                    ],
                  ),
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 0.5,
                    footer: 'F',
                    footerStyle:AppStyles.blackColor14TextBold.copyWith(color: ColorConstants.themeColor),
                    color: const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,
                    ],
                  ),
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 0.4,
                    footer: 'S',
                    footerStyle:AppStyles.blackColor14TextBold,
                    color:const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,

                    ],
                  ),
                  VerticalBarIndicator(
                    height: 30.h,
                    width: 10.w,
                    percent: 0.8,
                    footer: 'S',
                    footerStyle:AppStyles.blackColor14TextBold,
                    color: const [
                      ColorConstants.themeColor,
                      ColorConstants.themeColor,

                    ],
                  ),
                ],
                         ),
             ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text("😊",style: TextStyle(fontSize: 25.sp),),
                  SizedBox(width: 15.w,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Best Performance",style: AppStyles.blackColor14TextBold,),
                              Text("Monday",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.365,),
                          Text("10",style: AppStyles.blackColor14TextBold,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 10.h,),
            Divider(color: Colors.grey.shade400,),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text("😔",style: TextStyle(fontSize: 25.sp),),
                  SizedBox(width: 15.w,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Worst Performance",style: AppStyles.blackColor14TextBold,),
                              Text("Wednesday",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.34,),

                          Text("6",style: AppStyles.blackColor14TextBold,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
