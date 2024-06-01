import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import 'gender_screen.dart';

class UserInterestItem extends StatefulWidget {
  const UserInterestItem({super.key});

  @override
  State<UserInterestItem> createState() => _UserInterestItemState();
}

class _UserInterestItemState extends State<UserInterestItem> {
  @override
  List<int>item=[];
  final List<String>_image=[
    "assets/icons/fashion.png",
    "assets/icons/oragnic.png",
    "assets/icons/maditation.png",
    "assets/icons/finness.png",
    "assets/icons/somkefree.png",
    "assets/icons/bed.png",
    "assets/icons/health.png",
    "assets/icons/runnung.png",
    "assets/icons/vegan.png",
  ];
   final List<String>_list=[
    "Fashion",
    "Organic",
    "Meditation",
    "Fitness",
    "Smoke Free",
    "Sleep",
    "Health",
    "Running",
    "Vegan",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.skyColor,
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h,),
            const StepProgressIndicator(
              totalSteps: 7,
              currentStep: 5,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 40.h,),
            Text("Time to customize your interests",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height: 10.h,),
            GridView.builder(
                itemCount: _image.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
                ),
             itemBuilder: (context,index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    onTap: ()
                    {
                      if(item.contains(index))
                      {
                        item.remove(index);
                      }
                      else{
                        item.add(index);
                      }
                      setState(() {

                      });
                    },
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundColor:item.contains(index)?ColorConstants.themeColor.withOpacity(0.5): ColorConstants.whiteColor,
                      child: Image.asset(_image[index],height: 35,width: 35,),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(_list[index],style: AppStyles.blackColor14Text.copyWith(color: Colors.black,fontSize: 13.sp),),
                ],
              );
              }),
             const Spacer(),
            CustomButton(onTap: (){
              Get.to(GenderScreen());
            }, text: "Continue",),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
