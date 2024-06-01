import 'package:fit_clock/common/common_widget/common_button.dart';
import 'package:fit_clock/screen/user%20profile/user_interest_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';

class UserInterestScreen extends StatefulWidget {
  const UserInterestScreen({super.key});

  @override
  State<UserInterestScreen> createState() => _UserInterestScreenState();
}

class _UserInterestScreenState extends State<UserInterestScreen> {
  @override
  List<int>item=[];
  final List<String>_list=[
    "Weight loss",
    "Better sleeping habit",
     "Track my nutrition",
    "Improve overall fitness"
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
              currentStep: 4,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 40.h,),
            Text("Let us know how can help you?",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height: 10.h,),
            Text("You always can change this later .",style: AppStyles.gary14Color,),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: InkWell(
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
                    child: Container(
                      padding: EdgeInsets.only(left: 20.w,top: 15.h,bottom: 15.h,right: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: ColorConstants.whiteColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_list[index],style: AppStyles.gary14Color.copyWith(color: Colors.black87),),
                          CircleAvatar(
                            radius: 9.r,
                            backgroundColor:item.contains(index)?ColorConstants.themeColor: Colors.grey.shade200,
                            child: Icon(Icons.done,size: 13.sp,color: ColorConstants.whiteColor,),

                          )
                        ],
                      ),
                    ),
                  ),
                );
               }),
           const Spacer(),
           CustomButton(onTap: (){
             Get.to(UserInterestItem());
           }, text: "Continue",),
           SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
