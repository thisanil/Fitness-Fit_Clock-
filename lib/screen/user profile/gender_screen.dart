import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../home/bottom_bar.dart';


class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  int ?currentIndex ;
  final List<String>_list=[
    "Male",
    "Female",

  ];
  List<String>image=[
    "assets/image/male.png",
    "assets/image/woman.png"
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
              currentStep: 6,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 40.h,),
            Text("Which one you are?",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            GridView.builder(
                itemCount:2,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                  mainAxisExtent: 200.h
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    onTap: ()
                    {
                      currentIndex=index;
                      setState(() {

                      });
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.whiteColor,
                          border: Border.all(color:currentIndex==index?ColorConstants.themeColor:Colors.transparent,width: 2)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(image[index],height: 80.h,width: 80.w,),
                            SizedBox(height: 15.h,),
                            Text(_list[index],style: AppStyles.blackColor14Text.copyWith(color: Colors.black,fontSize: 13.sp),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const Spacer(),
            CustomButton(
              onTap: (){
                Get.offAll(BottomBar(index: 0,));
              }, text: "Continue",),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
