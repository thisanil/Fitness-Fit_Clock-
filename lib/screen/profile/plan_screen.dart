import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../../common/constants/image.dart';

class PlanScreen extends StatefulWidget {
   PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  List<int>itemSelect=[];

  List<String>price=["4.99","89.99"];

  List<String>version=["month","year"];

  Widget build(BuildContext context) {
    return  Scaffold(
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
      body:  Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Image.asset(ImageControl.appIcon,height: 100.h,width: 100.h,),
            Text('Go Premium\nGet unlimited access',style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
            Text("When you subscribe. You'll gain instantunlimited access",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
            SizedBox(height: 10.h,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context,index){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
                child: InkWell(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  onTap: (){
                    if(itemSelect.contains(index))
                    {
                      itemSelect.remove(index);
                    }
                    else{
                      itemSelect.add(index);



                    }
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorConstants.themeColor.withOpacity(0.1)
                    ),
                    child: ListTile(
                      leading:  CircleAvatar(
                        radius: 9.r,
                        backgroundColor:itemSelect.contains(index)?ColorConstants.themeColor:Colors.grey.shade200,
                        child: Icon(Icons.done,size: 13.sp,color:itemSelect.contains(index)?ColorConstants.whiteColor:Colors.grey.shade200,),
                      ),
                      title: Text.rich(TextSpan(text: "\$${price[index]}",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp,),
                        children: [
                          TextSpan(text: "/${version[index]}",style: AppStyles.blackColor8Text.copyWith(fontSize: 12.sp),)
                        ]
                      )),
                      trailing: CustomButton(
                        onTap: (){},
                        buttonHeight: 25.h,
                        buttonWidth: 100.w,
                        borderRadius:BorderRadius.circular(20.r),
                        text: "Free Trial",
                        color: ColorConstants.themeColor.withOpacity(0.3),
                        style:AppStyles.blackColor14TextBold.copyWith(fontSize: 14.sp,color: ColorConstants.themeColor) ,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            Text("Recurring billing. cancel anytime",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Text.rich(TextSpan(text: "Contrary to what many people think, eating healthy is not easier than done. Just a few good habits can make a great difference.",style: AppStyles.greyColor10Text.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w500)
              )),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              child: CustomButton(onTap: (){},
              text: "Purchase",
              ),
            )
          ],
        ),
      ),
    );
  }
}
