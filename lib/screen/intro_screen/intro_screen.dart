import 'package:fit_clock/common/common_widget/common_button.dart';
import 'package:fit_clock/common/constants/colors.dart';
import 'package:fit_clock/common/constants/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constants/font_style.dart';
import '../auth/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController controller=PageController();
  int currIndex=0;
  List<Widget>_list=<Widget>[
    Column(
      children: [
        Text('Welcome to Fit Clock',style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
        SizedBox(height: 10.h,),
        Text('The best Fit Clock app for your heath and fitness !',style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
        SizedBox(height: 20.h,),
        Container(
          height: 350.h,
          width: 400.w,
          decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageControl.runImage),
                  fit: BoxFit.fill
              )
          ),
        ),
      ],
    ),
    Column(
      children: [
        Text('Training together. More Fun',style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
        SizedBox(height: 10.h,),
        Text('You can train your friend and family together !',style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
        Container(
          height: 300.h,
          width: 400.w,
          decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageControl.fitFunImage),
                  fit: BoxFit.fill
              )
          ),
        ),
      ],
    ),
    Column(
      children: [
        Text('Effortlessly track & Measure Data',style: AppStyles.blackDarkColor20text.copyWith(fontSize: 30.sp),),
        SizedBox(height: 10.h,),
        Text('Easy-to-see training plan at your fingertips. !',style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
        Container(
          height: 300.h,
          width: 400.w,
          decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageControl.dataTrackImage),
                  fit: BoxFit.fill
              )
          ),
        ),
      ],
    ),

  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.skyColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h,),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const LoginScreen());
                },
                child: Container(

                  height: 20.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorConstants.themeColor.withOpacity(0.2)
                  ),
                  child: Center(child: Text("Skip >>",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,color: ColorConstants.blackColor),)),
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            Container(
              height: 440.h,
              width: double.maxFinite,
              child: PageView(
                children: _list,
                controller: controller,
                onPageChanged: (value){
                 currIndex=value;
                 setState(() {

                 });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 20.h,
                  width: 40.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:EdgeInsets.only(right: 5.w),
                          child: AnimatedContainer(
                            height:currIndex==index?8.h:7.h,
                            width:currIndex==index?8.h:7.w,
                            duration:const Duration(milliseconds: 600),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currIndex==index?ColorConstants.themeColor:Colors.grey
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
            const Spacer(),
            CustomButton(
                onTap: (){
                  if(currIndex==2)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }
                  else{
                    controller.jumpToPage(currIndex+1);
                  }

                },
              text: currIndex==2?"Get Start":"Next",
              buttonHeight: 40.h,
            ),

            SizedBox(height: 10.h,),
            Text.rich(
                TextSpan(
                  text: "Already have an account ? ",style: AppStyles.blackColor14Text,
                  children: [
                    TextSpan(
                      text: "Sign in",style: AppStyles.blackColor14Text.copyWith(color: ColorConstants.themeColor),
                    )
                  ]
                ))
          ],
        ),
      ),
    );
  }
}
