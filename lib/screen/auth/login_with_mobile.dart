import 'package:country_picker/country_picker.dart';
import 'package:fit_clock/common/common_widget/common_button.dart';
import 'package:fit_clock/common/common_widget/common_textfield.dart';
import 'package:fit_clock/common/constants/image.dart';
import 'package:fit_clock/screen/auth/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';

class LoginWithMobile extends StatelessWidget {
  const LoginWithMobile({super.key});

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
              currentStep: 0,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 40.h,),
            Text("Let's start with your mobile number",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height: 50.h,),
            IntlPhoneField(
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(Icons.arrow_drop_down_rounded, color:  ColorConstants.greyColor,),
              dropdownTextStyle:  AppStyles.gary14Color,
              cursorColor:  ColorConstants.greyColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConstants.whiteColor,

                hintStyle: AppStyles.gary14Color,
                contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                hintText: 'Phone Number',
                errorStyle: const TextStyle(
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:  BorderSide(color:Colors.transparent),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:  BorderSide(color: ColorConstants.greenLightColor.withOpacity(0.2)),
                ),
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:  BorderSide(color: ColorConstants.whiteColor.withOpacity(0.2)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide:  BorderSide(color: ColorConstants.whiteColor.withOpacity(0.2)),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),


            const Spacer(),
            CustomButton(

              onTap: (){
                Get.to(OTPScreen());
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

