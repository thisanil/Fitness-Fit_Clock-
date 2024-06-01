import 'package:fit_clock/common/common_widget/common_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import 'email_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
              currentStep: 1,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 40.h,),
            Text("We send a code to verify your number",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height: 50.h,),
            Pinput(
             length: 4,
              mainAxisAlignment: MainAxisAlignment.center,

              defaultPinTheme: PinTheme(
                textStyle: AppStyles.gary14Color,
                width: 60,
                height: 60,
                margin:  EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: ColorConstants.whiteColor,
                  borderRadius: BorderRadius.circular(15.r),
                )
              ),
              focusedPinTheme: PinTheme(
                  textStyle: AppStyles.gary14Color,
                  width: 60,
                  height: 60,
                  margin:  EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: ColorConstants.themeColor.withOpacity(0.7),width: 2)
                  )
              ),
            ),
            const Spacer(),
            Text.rich(TextSpan(
              text: "Didn't receive OTP ?",style: AppStyles.grayLight16Text.copyWith(fontSize: 14.sp),
              children: [
                TextSpan(
                  text: " Resend OTP",style: AppStyles.grayLight16Text.copyWith(fontSize: 14.sp,color: ColorConstants.themeColor),

                )
              ]
            )),
            SizedBox(height: 20.h,),
            CustomButton(
              onTap: (){
                Get.to(EmailScreen());
              },
              text: "Continue",
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
}
