import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  bool _switchValue = true;
  bool _switchMail = false;

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Setting",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
              SizedBox(height: 20.h,),
              Text("Edit Profile",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 10.h,),
              Text("Invite Friends",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Text("Push Notification",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _switchValue,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 7.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 7.h,),
              Row(
                children: [
                  Text("Subscribe Email",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _switchMail,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      setState(() {
                        _switchMail = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 7.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 7.h,),
              Text("Give Feedback",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 10.h,),
              Text("Help & Support ",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 10.h,),
              Text("Connect Device",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 10.h,),
              Text("About Us",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp),),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 10.h,),
              Text("Log Out",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 16.sp,color: ColorConstants.themeColor),),

            ],
          ),
        ),
      ),
    );
  }
}
