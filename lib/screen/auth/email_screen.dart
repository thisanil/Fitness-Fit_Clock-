import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/common_widget/common_textfield.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import 'bio_matric_login.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  bool _isObscure = false;
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
              currentStep: 2,
              selectedColor: ColorConstants.themeColor,
              unselectedColor:ColorConstants.greyColor,
            ),
            SizedBox(height: 40.h,),
            Text("Let's setup email and password?",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
            SizedBox(height: 50.h,),
            CustomTextField(
              prefixIcon: Icon(Icons.email),
              fillColor: ColorConstants.whiteColor,
              hintText: "Email Address",
            ),
            SizedBox(height: 20.h,),
            CustomTextField(
              maxLines: 1,
              obscureText: _isObscure,
              prefixIcon:const Icon(Icons.lock),
              suffix: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,color: ColorConstants.themeColor,),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }),
              fillColor: ColorConstants.whiteColor,
              hintText: "Password",
            ),
            const Spacer(),
            CustomButton(

              onTap: (){
               Get.to(BioMatricLogin());
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
